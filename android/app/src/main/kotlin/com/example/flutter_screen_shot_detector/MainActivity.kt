package com.example.flutter_screen_shot_detector

import android.os.Bundle
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val screenshotChannel = "screen_protect/screenshot"
    private val recordingChannel = "screen_protect/screen_recording"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val messenger = flutterEngine.dartExecutor.binaryMessenger

        // 📸 Dummy Screenshot Channel
        MethodChannel(messenger, screenshotChannel).setMethodCallHandler { _, _ -> }

        // 🎥 Detect Recording
        EventChannel(messenger, recordingChannel).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    // Always false (Android can't detect reliably)
                    events?.success(false)
                }

                override fun onCancel(arguments: Any?) { }
            }
        )
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // 🛡 BLOCK SCREENSHOT & SCREEN RECORDING
        window.setFlags(
            WindowManager.LayoutParams.FLAG_SECURE,
            WindowManager.LayoutParams.FLAG_SECURE
        )
    }
}
