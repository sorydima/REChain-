import 'package:rechainonline/utils/voip_plugin.dart';

void main() async {
  final voip = VoipPlugin.instance;
  await voip.initialize();
  await voip.startCall('roomId', 'userId');
  print('Call started!');
  await voip.endCall();
  print('Call ended.');
} 