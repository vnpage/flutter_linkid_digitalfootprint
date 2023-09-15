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
