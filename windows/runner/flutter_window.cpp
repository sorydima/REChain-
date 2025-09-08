#include "flutter_window.h"

#include <optional>
#include <flutter/method_channel.h>
#include <flutter/standard_method_codec.h>

#include "flutter/generated_plugin_registrant.h"
#include "AutonomousNotificationService.h"
#include "CrashReportingManager.h"

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());
  SetupMethodChannels();
  SetChildContent(flutter_controller_->view()->GetNativeWindow());
  return true;
}

void FlutterWindow::OnDestroy() {
  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

void FlutterWindow::SetupMethodChannels() {
  auto& notificationService = AutonomousNotificationService::GetInstance();
  auto& crashManager = CrashReportingManager::GetInstance();
  
  // Setup autonomous notification method channel
  auto autonomous_channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
      flutter_controller_->engine()->messenger(), "com.rechain.dapp/autonomous_notifications",
      &flutter::StandardMethodCodec::GetInstance());

  autonomous_channel->SetMethodCallHandler([&notificationService, &crashManager](
      const flutter::MethodCall<flutter::EncodableValue>& call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
    
    const std::string& method = call.method_name();
    const auto* arguments = std::get_if<flutter::EncodableMap>(call.arguments());
    
    crashManager.LogDebug("Method channel call: " + method);
    
    if (method == "showMessageNotification") {
      if (arguments) {
        auto sender_it = arguments->find(flutter::EncodableValue("sender"));
        auto message_it = arguments->find(flutter::EncodableValue("message"));
        auto roomId_it = arguments->find(flutter::EncodableValue("roomId"));
        
        if (sender_it != arguments->end() && message_it != arguments->end() && roomId_it != arguments->end()) {
          std::string sender = std::get<std::string>(sender_it->second);
          std::string message = std::get<std::string>(message_it->second);
          std::string roomId = std::get<std::string>(roomId_it->second);
          
          std::wstring wSender(sender.begin(), sender.end());
          std::wstring wMessage(message.begin(), message.end());
          std::wstring wRoomId(roomId.begin(), roomId.end());
          
          notificationService.ShowMessageNotification(wSender, wMessage, wRoomId);
          result->Success();
          return;
        }
      }
    } else if (method == "showCallNotification") {
      if (arguments) {
        auto caller_it = arguments->find(flutter::EncodableValue("caller"));
        auto callId_it = arguments->find(flutter::EncodableValue("callId"));
        auto isVideo_it = arguments->find(flutter::EncodableValue("isVideo"));
        
        if (caller_it != arguments->end() && callId_it != arguments->end()) {
          std::string caller = std::get<std::string>(caller_it->second);
          std::string callId = std::get<std::string>(callId_it->second);
          bool isVideo = isVideo_it != arguments->end() ? std::get<bool>(isVideo_it->second) : false;
          
          std::wstring wCaller(caller.begin(), caller.end());
          std::wstring wCallId(callId.begin(), callId.end());
          
          notificationService.ShowCallNotification(wCaller, wCallId, isVideo);
          result->Success();
          return;
        }
      }
    } else if (method == "cancelAllNotifications") {
      notificationService.CancelAllNotifications();
      result->Success();
      return;
    } else if (method == "setNotificationsEnabled") {
      if (arguments) {
        auto enabled_it = arguments->find(flutter::EncodableValue("enabled"));
        if (enabled_it != arguments->end()) {
          bool enabled = std::get<bool>(enabled_it->second);
          notificationService.SetNotificationsEnabled(enabled);
          result->Success();
          return;
        }
      }
    }
    
    result->NotImplemented();
  });

  // Setup crash reporting method channel
  auto crash_channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
      flutter_controller_->engine()->messenger(), "com.rechain.dapp/crash_reporting",
      &flutter::StandardMethodCodec::GetInstance());

  crash_channel->SetMethodCallHandler([&crashManager](
      const flutter::MethodCall<flutter::EncodableValue>& call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
    
    const std::string& method = call.method_name();
    const auto* arguments = std::get_if<flutter::EncodableMap>(call.arguments());
    
    if (method == "recordError") {
      if (arguments) {
        auto error_it = arguments->find(flutter::EncodableValue("error"));
        if (error_it != arguments->end()) {
          std::string error = std::get<std::string>(error_it->second);
          crashManager.RecordError(error);
          result->Success();
          return;
        }
      }
    } else if (method == "log") {
      if (arguments) {
        auto message_it = arguments->find(flutter::EncodableValue("message"));
        auto level_it = arguments->find(flutter::EncodableValue("level"));
        
        if (message_it != arguments->end()) {
          std::string message = std::get<std::string>(message_it->second);
          std::string level = level_it != arguments->end() ? std::get<std::string>(level_it->second) : "INFO";
          crashManager.Log(message, level);
          result->Success();
          return;
        }
      }
    } else if (method == "setUserId") {
      if (arguments) {
        auto userId_it = arguments->find(flutter::EncodableValue("userId"));
        if (userId_it != arguments->end()) {
          std::string userId = std::get<std::string>(userId_it->second);
          crashManager.SetUserId(userId);
          result->Success();
          return;
        }
      }
    }
    
    result->NotImplemented();
  });
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
