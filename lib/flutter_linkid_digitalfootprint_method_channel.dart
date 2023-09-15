import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_linkid_digitalfootprint_platform_interface.dart';

/// An implementation of [FlutterLinkidDigitalfootprintPlatform] that uses method channels.
class MethodChannelFlutterLinkidDigitalfootprint extends FlutterLinkidDigitalfootprintPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_linkid_digitalfootprint');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> initService({required String tenantId, required String apiKey, required String url}) async {
    // TODO: implement initService
    return await methodChannel.invokeMethod<bool>('initService', {'tenantId': tenantId, 'apiKey': apiKey, 'url': url}) ?? false;
  }
}
