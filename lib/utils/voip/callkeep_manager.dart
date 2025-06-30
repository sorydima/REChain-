import 'dart:async';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

// Stub implementation for web compatibility
class CallKeepManager {
  factory CallKeepManager() {
    return _instance;
  }

  CallKeepManager._internal();

  static final CallKeepManager _instance = CallKeepManager._internal();

  String get appName => 'REChain';

  Future<bool> get hasPhoneAccountEnabled async => false;

  Map<String, dynamic> get alertOptions => <String, dynamic>{
        'alertTitle': 'Permissions required',
        'alertDescription':
            'Allow $appName to register as a calling account? This will allow calls to be handled by the native android dialer.',
        'cancelButton': 'Cancel',
        'okButton': 'ok',
        'foregroundService': {
          'channelId': 'com.rechain.online',
          'channelName': 'Foreground service for my app',
          'notificationTitle': '$appName is running on background',
          'notificationIcon': 'mipmap/ic_notification_launcher',
        },
        'additionalPermissions': [''],
      };

  bool setupDone = false;

  Future<void> showCallkitIncoming(CallSession call) async {
    // Web stub - no native callkit support
    debugPrint('CallKeep: showCallkitIncoming called (web stub)');
  }

  void removeCall(String? callUUID) {
    // Web stub
  }

  void addCall(String? callUUID, dynamic callKeeper) {
    // Web stub
  }

  void setCallHeld(String? callUUID, bool? held) {
    // Web stub
  }

  void setCallMuted(String? callUUID, bool? muted) {
    // Web stub
  }

  void didDisplayIncomingCall(dynamic event) {
    // Web stub
  }

  void onPushKitToken(dynamic event) {
    // Web stub
  }

  Future<void> initialize() async {
    // Web stub
    debugPrint('CallKeep: Initialized (web stub)');
  }

  Future<void> hangup(String callUUID) async {
    // Web stub
  }

  Future<void> reject(String callUUID) async {
    // Web stub
  }

  Future<void> answer(String? callUUID) async {
    // Web stub
  }

  Future<void> setOnHold(String callUUID, bool held) async {
    // Web stub
  }

  Future<void> setMutedCall(String callUUID, bool muted) async {
    // Web stub
  }

  Future<void> updateDisplay(String callUUID) async {
    // Web stub
  }

  Future<void> displayIncomingCall(CallSession call) async {
    // Web stub
    debugPrint('CallKeep: displayIncomingCall called (web stub)');
  }

  void answerCall(dynamic event) {
    // Web stub
  }

  void didPerformDTMFAction(dynamic event) {
    // Web stub
  }

  void didToggleHoldCallAction(dynamic event) {
    // Web stub
  }

  void didPerformSetMutedCallAction(dynamic event) {
    // Web stub
  }

  void endCall(dynamic event) {
    // Web stub
  }

  Future<void> endAllCalls() async {
    // Web stub
  }

  Future<void> rejectCall(String callUUID) async {
    // Web stub
  }

  Future<void> answerIncomingCall(String callUUID) async {
    // Web stub
  }

  void on(dynamic event, Function callback) {
    // Web stub
  }

  Future<void> setup(dynamic options, Map<String, dynamic> config, {bool backgroundMode = false}) async {
    // Web stub
  }
}

// Stub classes for web compatibility
class CallKeeper {
  CallKeeper(this.callKeepManager, this.call) {
    call.onCallStateChanged.stream.listen(_handleCallState);
  }

  CallKeepManager callKeepManager;
  bool? held = false;
  bool? muted = false;
  bool connected = false;
  CallSession call;

  void _handleCallState(CallState state) {
    debugPrint('CallKeepManager::handleCallState: ${state.toString()}');
    switch (state) {
      case CallState.kConnecting:
        debugPrint('callkeep connecting');
        break;
      case CallState.kConnected:
        debugPrint('callkeep connected');
        if (!connected) {
          callKeepManager.answer(call.callId);
        } else {
          callKeepManager.setMutedCall(call.callId, false);
          callKeepManager.setOnHold(call.callId, false);
        }
        break;
      case CallState.kEnded:
        callKeepManager.hangup(call.callId);
        break;

      case CallState.kFledgling:
      case CallState.kInviteSent:
      case CallState.kWaitLocalMedia:
      case CallState.kCreateOffer:
      case CallState.kCreateAnswer:
      case CallState.kRinging:
      case CallState.kEnding:
        break;
    }
  }
}

Map<String?, CallKeeper> calls = <String?, CallKeeper>{};

// Stub FlutterCallkeep class
class FlutterCallkeep {
  Future<bool> hasPhoneAccount() async => false;
  
  Future<void> setup(dynamic options, Map<String, dynamic> config, {bool backgroundMode = false}) async {
    // Web stub
  }
  
  Future<void> endCall(String callUUID) async {
    // Web stub
  }
  
  Future<void> rejectCall(String callUUID) async {
    // Web stub
  }
  
  Future<void> answerIncomingCall(String callUUID) async {
    // Web stub
  }
  
  Future<void> setOnHold(String callUUID, bool held) async {
    // Web stub
  }
  
  Future<void> setMutedCall(String callUUID, bool muted) async {
    // Web stub
  }
  
  Future<void> updateDisplay(String callUUID, {String? displayName, String? handle}) async {
    // Web stub
  }
  
  void on(dynamic event, Function callback) {
    // Web stub
  }
  
  Future<void> endAllCalls() async {
    // Web stub
  }
}

// Stub event classes
class CallKeepDidDisplayIncomingCall {
  final String? callUUID;
  final String? handle;
  
  CallKeepDidDisplayIncomingCall({this.callUUID, this.handle});
}

class CallKeepPushKitToken {
  final String? token;
  
  CallKeepPushKitToken({this.token});
}

class CallKeepPerformAnswerCallAction {
  final String? callUUID;
  
  CallKeepPerformAnswerCallAction({this.callUUID});
}

class CallKeepDidPerformDTMFAction {
  final String? callUUID;
  final String? digits;
  
  CallKeepDidPerformDTMFAction({this.callUUID, this.digits});
}

class CallKeepDidToggleHoldAction {
  final String? callUUID;
  final bool? held;
  
  CallKeepDidToggleHoldAction({this.callUUID, this.held});
}

class CallKeepDidPerformSetMutedCallAction {
  final String? callUUID;
  final bool? muted;
  
  CallKeepDidPerformSetMutedCallAction({this.callUUID, this.muted});
}

class CallKeepPerformEndCallAction {
  final String? callUUID;
  
  CallKeepPerformEndCallAction({this.callUUID});
}

// Stub Logs class
class Logs {
  static void i(String message) => debugPrint('[INFO] $message');
  static void e(String message) => debugPrint('[ERROR] $message');
  static void v(String message) => debugPrint('[VERBOSE] $message');
  static void w(String message) => debugPrint('[WARNING] $message');
  static void d(String message) => debugPrint('[DEBUG] $message');
}

// Stub platform check
bool get isIOS => false; 