import 'flutter_linkid_digitalfootprint_platform_interface.dart';

class FlutterLinkidDigitalFootprint {
  static final FlutterLinkidDigitalFootprint shared =
      FlutterLinkidDigitalFootprint._internal();

  factory FlutterLinkidDigitalFootprint() {
    return shared;
  }

  FlutterLinkidDigitalFootprint._internal() {}

  Future<String?> getPlatformVersion() {
    return FlutterLinkidDigitalfootprintPlatform.instance.getPlatformVersion();
  }

  void initService(
      {required String tenantId, required String apiKey, required String url}) {
    FlutterLinkidDigitalfootprintPlatform.instance
        .initService(tenantId: tenantId, apiKey: apiKey, url: url);
  }

  void setShowLog(bool showLog) {
    FlutterLinkidDigitalfootprintPlatform.instance.setShowLog(showLog);
  }

  void logEvent(String eventName, Map<String, dynamic>? data) {
    FlutterLinkidDigitalfootprintPlatform.instance.logEvent(eventName, data);
  }
  void startScreenFlow(String screenName) {
    FlutterLinkidDigitalfootprintPlatform.instance.startScreenFlow(screenName);
  }
  void endScreenFlow(String screenName, Map<String, dynamic>? data) {
    FlutterLinkidDigitalfootprintPlatform.instance.endScreenFlow(screenName, data);
  }
  void setCurrentScreen(String screenName, Map<String, dynamic>? data) {
    FlutterLinkidDigitalfootprintPlatform.instance.setCurrentScreen(screenName, data);
  }
}
