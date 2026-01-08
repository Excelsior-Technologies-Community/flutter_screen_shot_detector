import 'package:flutter/services.dart';

class ScreenshotDetector {
  static const _channel = MethodChannel('screen_protect/screenshot');

  static Future<void> initialize(Function onScreenshot) async {
    _channel.setMethodCallHandler((call) async {
      if (call.method == "onScreenshot") {
        onScreenshot();
      }
    });
  }
}
