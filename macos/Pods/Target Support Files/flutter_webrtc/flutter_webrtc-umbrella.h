#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AudioUtils.h"
#import "FlutterRPScreenRecorder.h"
#import "FlutterRTCDataChannel.h"
#import "FlutterRTCDesktopCapturer.h"
#import "FlutterRTCFrameCapturer.h"
#import "FlutterRTCFrameCryptor.h"
#import "FlutterRTCMediaStream.h"
#import "FlutterRTCPeerConnection.h"
#import "FlutterRTCVideoRenderer.h"
#import "FlutterWebRTCPlugin.h"

FOUNDATION_EXPORT double flutter_webrtcVersionNumber;
FOUNDATION_EXPORT const unsigned char flutter_webrtcVersionString[];

