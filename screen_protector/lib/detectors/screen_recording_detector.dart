import 'package:flutter/services.dart';

class ScreenRecordingDetector {
  static const _eventChannel = EventChannel('screen_protect/screen_recording');

  static void listen(Function(bool) onEvent) {
    _eventChannel.receiveBroadcastStream().listen((event) {
      onEvent(event == true);
    });
  }
}
