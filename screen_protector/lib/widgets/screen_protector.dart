import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/detector_controller.dart';
import '../detectors/screenshot_detector.dart';
import '../detectors/screen_recording_detector.dart';

class ScreenProtector extends StatefulWidget {
  final Widget child; // 👈 REQUIRED

  const ScreenProtector({super.key, required this.child});

  @override
  State<ScreenProtector> createState() => _ScreenProtectorState();
}

class _ScreenProtectorState extends State<ScreenProtector> {
  final controller = DetectorController();

  @override
  void initState() {
    super.initState();

    ScreenshotDetector.initialize(() {
      debugPrint("📸 Screenshot detected!!!");
      controller.onScreenshotTaken();
    });

    ScreenRecordingDetector.listen((isRecording) {
      debugPrint("🎥 Recording: $isRecording");
      controller.onScreenRecordChanged(isRecording);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Stack(
          children: [
            // 🔥 Always show provided child
            widget.child,

            // 🎥 If screen recording ON → blur + block
            if (controller.isRecording) ...[
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    color: Colors.black.withOpacity(0.85),
                    alignment: Alignment.center,
                    child: const Text(
                      "Recording Not Allowed 🔒",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
