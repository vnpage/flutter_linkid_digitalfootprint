import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_linkid_digitalfootprint/flutter_linkid_digitalfootprint.dart';
import 'package:flutter_linkid_digitalfootprint/flutter_linkid_digitalfootprint_platform_interface.dart';
import 'package:flutter_linkid_digitalfootprint/flutter_linkid_digitalfootprint_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLinkidDigitalfootprintPlatform
    with MockPlatformInterfaceMixin
    implements FlutterLinkidDigitalfootprintPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> initService({required String tenantId, required String apiKey, required String url}) {
    // TODO: implement initService
    throw UnimplementedError();
  }

  @override
  Future<bool> saveInputEvent(Map<String, dynamic> data) {
    // TODO: implement saveInputEvent
    throw UnimplementedError();
  }

  @override
  Future<bool> setShowLog(bool showLog) {
    // TODO: implement setShowLog
    throw UnimplementedError();
  }

  @override
  Future<bool> endScreenFlow(String screenName, Map<String, dynamic>? data) {
    // TODO: implement endScreen
    throw UnimplementedError();
  }

  @override
  Future<bool> logEvent(String eventName, Map<String, dynamic>? data) {
    // TODO: implement logEvent
    throw UnimplementedError();
  }

  @override
  Future<bool> startScreenFlow(String screenName) {
    // TODO: implement startScreen
    throw UnimplementedError();
  }

  @override
  Future<bool> setCurrentScreen(String screenName, Map<String, dynamic>? data) {
    // TODO: implement setCurrentScreen
    throw UnimplementedError();
  }
}

void main() {
  final FlutterLinkidDigitalfootprintPlatform initialPlatform = FlutterLinkidDigitalfootprintPlatform.instance;

  test('$MethodChannelFlutterLinkidDigitalfootprint is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLinkidDigitalfootprint>());
  });

  test('getPlatformVersion', () async {
    FlutterLinkidDigitalFootprint flutterLinkidDigitalfootprintPlugin = FlutterLinkidDigitalFootprint();
    MockFlutterLinkidDigitalfootprintPlatform fakePlatform = MockFlutterLinkidDigitalfootprintPlatform();
    FlutterLinkidDigitalfootprintPlatform.instance = fakePlatform;

    expect(await flutterLinkidDigitalfootprintPlugin.getPlatformVersion(), '42');
  });
}
