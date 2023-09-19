import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_linkid_digitalfootprint_method_channel.dart';

abstract class FlutterLinkidDigitalfootprintPlatform extends PlatformInterface {
  /// Constructs a FlutterLinkidDigitalfootprintPlatform.
  FlutterLinkidDigitalfootprintPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLinkidDigitalfootprintPlatform _instance =
      MethodChannelFlutterLinkidDigitalfootprint();

  /// The default instance of [FlutterLinkidDigitalfootprintPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLinkidDigitalfootprint].
  static FlutterLinkidDigitalfootprintPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLinkidDigitalfootprintPlatform] when
  /// they register themselves.
  static set instance(FlutterLinkidDigitalfootprintPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> initService(
      {required String tenantId, required String apiKey, required String url}) {
    throw UnimplementedError('initService() has not been implemented.');
  }

  Future<bool> saveInputEvent(Map<String, dynamic> data) {
    throw UnimplementedError('saveInputEvent() has not been implemented.');
  }

  Future<bool> setShowLog(bool showLog) {
    throw UnimplementedError('setShowLog() has not been implemented.');
  }
}
