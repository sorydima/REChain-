#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>
#include <iostream>

#include "flutter_window.h"
#include "utils.h"
#include "AutonomousNotificationService.h"
#include "CrashReportingManager.h"
#include "BuildConfigHelper.h"

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  // Initialize crash reporting first
  CrashReportingManager& crashManager = CrashReportingManager::GetInstance();
  if (!crashManager.Initialize()) {
    std::wcerr << L"Failed to initialize crash reporting" << std::endl;
  }

  // Log application startup
  crashManager.LogInfo("REChain Windows application starting");
  crashManager.StartSession();

  // Set build and device info as custom keys
  auto allInfo = BuildConfigHelper::GetAllInfoAsMap();
  crashManager.SetCustomKeys(allInfo);

  // Log version and device information
  BuildConfigHelper::LogVersionInfo();
  BuildConfigHelper::LogDeviceInfo();

  // Attach to console when present (e.g., 'flutter run') or create a
  // new console when running with a debugger.
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  // Initialize COM, so that it is available for use in the library and/or
  // plugins.
  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

  // Initialize notification service
  AutonomousNotificationService& notificationService = AutonomousNotificationService::GetInstance();
  if (!notificationService.Initialize()) {
    crashManager.LogError("Failed to initialize notification service");
  } else {
    crashManager.LogInfo("Notification service initialized successfully");
  }

  flutter::DartProject project(L"data");

  std::vector<std::string> command_line_arguments =
      GetCommandLineArguments();

  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1280, 720);
  
  crashManager.LogInfo("Creating main window");
  
  if (!window.CreateAndShow(L"REChain - Decentralized Communication", origin, size)) {
    crashManager.LogError("Failed to create and show main window");
    return EXIT_FAILURE;
  }
  
  window.SetQuitOnClose(true);
  crashManager.LogInfo("Main window created successfully");

  // Show login success notification for demo
  notificationService.ShowLoginSuccessNotification(L"Welcome to REChain!");

  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }

  // Cleanup
  crashManager.LogInfo("Application shutting down");
  notificationService.Shutdown();
  crashManager.EndSession();
  crashManager.Shutdown();

  ::CoUninitialize();
  return EXIT_SUCCESS;
}
