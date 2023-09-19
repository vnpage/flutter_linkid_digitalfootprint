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
}
