import 'package:flutter/material.dart';

class DetectorController extends ChangeNotifier {
  bool isRecording = false;
  bool tookScreenshot = false;

  void onScreenRecordChanged(bool recording) {
    isRecording = recording;
    notifyListeners();
  }

  void onScreenshotTaken() {
    tookScreenshot = true;
    notifyListeners();
  }

  void resetScreenshotFlag() {
    tookScreenshot = false;
    notifyListeners();
  }
}
