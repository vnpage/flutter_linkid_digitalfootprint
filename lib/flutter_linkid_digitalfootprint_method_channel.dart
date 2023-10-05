import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_linkid_digitalfootprint_platform_interface.dart';

/// An implementation of [FlutterLinkidDigitalfootprintPlatform] that uses method channels.
class MethodChannelFlutterLinkidDigitalfootprint
    extends FlutterLinkidDigitalfootprintPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_linkid_digitalfootprint');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> initService(
      {required String tenantId,
      required String apiKey,
      required String url}) async {
    try {
      // final version =
      // await methodChannel.invokeMethod<String>('getPlatformVersion');
      // print(version);
      final result = await methodChannel.invokeMethod<bool>(
          'initService', {'tenantId': tenantId, 'apiKey': apiKey, 'url': url});
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<bool> saveInputEvent(Map<String, dynamic> data) async {
    try {
      final result = await methodChannel
          .invokeMethod<bool>('saveInputEvent', {'data': data});
      return result ?? false;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<bool> setShowLog(bool showLog) async {
    try {
      final result = await methodChannel
          .invokeMethod<bool>('setShowLog', {'showLog': showLog});
      return result ?? false;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<bool> logEvent(String eventName, Map<String, dynamic>? data) async {
    try {
      final result = await methodChannel
          .invokeMethod<bool>('logEvent', {'eventName': eventName, 'data': data});
      return result ?? false;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<bool> startScreen(String screenName) async {
    try {
      final result = await methodChannel
          .invokeMethod<bool>('startScreen', {'screenName': screenName});
      return result ?? false;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<bool> endScreen(String screenName, Map<String, dynamic>? data) async {
    try {
      final result = await methodChannel
          .invokeMethod<bool>('endScreen', {'screenName': screenName, 'data': data});
      return result ?? false;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
