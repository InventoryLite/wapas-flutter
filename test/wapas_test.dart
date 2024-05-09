import 'package:flutter_test/flutter_test.dart';
import 'package:wapas/wapas.dart';
import 'package:wapas/wapas_platform_interface.dart';
import 'package:wapas/wapas_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWapasPlatform
    with MockPlatformInterfaceMixin
    implements WapasPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WapasPlatform initialPlatform = WapasPlatform.instance;

  test('$MethodChannelWapas is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWapas>());
  });

  test('getPlatformVersion', () async {
    Wapas wapasPlugin = Wapas();
    MockWapasPlatform fakePlatform = MockWapasPlatform();
    WapasPlatform.instance = fakePlatform;

    expect(await wapasPlugin.getPlatformVersion(), '42');
  });
}
