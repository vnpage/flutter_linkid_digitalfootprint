import Flutter
import UIKit
import LinkIdDigitalFootprint

public class FlutterLinkidDigitalfootprintPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_linkid_digitalfootprint", binaryMessenger: registrar.messenger())
    let instance = FlutterLinkidDigitalfootprintPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "initService":
        if let args = call.arguments as? Dictionary<String, Any>, let tenantId = args["tenantId"] as? String, let apiKey = args["apiKey"] as? String, let url = args["url"] as? String {
            print("initService \(tenantId)")
            DigitalFootprint.initSevice(tenantId: tenantId, apiKey: apiKey, url: url)
            result(true)
        } else {
            result(false)
        }
    case "setShowLog":
        if let args = call.arguments  as? Dictionary<String, Any>, let showLog = args["showLog"] as? Bool {
            DigitalFootprint.setShowLog(showLog)
            result(true)
        } else {
            result(false)
        }
    case "saveInputEvent":
        if let args = call.arguments  as? Dictionary<String, Any>, let data = args["data"] as? Dictionary<String, Any> {
            DigitalFootprint.saveInputEvent(data)
            result(true)
        } else {
            result(false)
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
