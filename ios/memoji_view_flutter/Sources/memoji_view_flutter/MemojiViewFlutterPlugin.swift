import Flutter
import UIKit
import MemojiView

public class MemojiViewFlutterPlugin: NSObject, FlutterPlugin, MemojiViewDelegate {
    private var result: FlutterResult?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "memoji_view_flutter", binaryMessenger: registrar.messenger())
        let instance = MemojiViewFlutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "pickMemoji":
            self.result = result
            let memojiView = MemojiView(frame: UIScreen.main.bounds)
            memojiView.delegate = self
            if let viewController = UIApplication.shared.delegate?.window?.rootViewController {
                viewController.view.addSubview(memojiView)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func didUpdateImage(image: UIImage, type: ImageType) {
        guard let result = self.result else {
            return
        }
        
        guard let imageData = image.jpegData(compressionQuality: 1.0) as? NSData else {
            return
        }
        
        let count = imageData.length / MemoryLayout<Int8>.size
        var bytes = [UInt8](repeating: 0, count: count)
        imageData.getBytes(&bytes, length:count * MemoryLayout<Int8>.size)
        result(bytes)
    }
}
