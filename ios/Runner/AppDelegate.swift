import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let screenshotChannel = "screen_protect/screenshot"
  private let screenRecordingChannel = "screen_protect/screen_recording"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller = window?.rootViewController as! FlutterViewController

    // 📸 Screenshot Notify
    let methodChannel = FlutterMethodChannel(name: screenshotChannel, binaryMessenger: controller.binaryMessenger)
    NotificationCenter.default.addObserver(self,
      selector: #selector(onScreenshot),
      name: UIApplication.userDidTakeScreenshotNotification,
      object: nil)

    // 🎥 Screen Recording Stream
    let eventChannel = FlutterEventChannel(name: screenRecordingChannel, binaryMessenger: controller.binaryMessenger)
    eventChannel.setStreamHandler(ScreenRecordHandler())

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  @objc func onScreenshot() {
    let controller = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(name: screenshotChannel, binaryMessenger: controller.binaryMessenger)
    methodChannel.invokeMethod("onScreenshot", nil)
  }
}

class ScreenRecordHandler: NSObject, FlutterStreamHandler {
  private var eventSink: FlutterEventSink?

  override func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    self.eventSink = events
    update()
    NotificationCenter.default.addObserver(self, selector: #selector(update),
                                           name: UIScreen.capturedDidChangeNotification, object: nil)
    return nil
  }

  override func onCancel(withArguments arguments: Any?) -> FlutterError? {
    NotificationCenter.default.removeObserver(self)
    return nil
  }

  @objc func update() {
    eventSink?(UIScreen.main.isCaptured)
  }
}
