import 'package:flutter_test/flutter_test.dart';
import 'package:dsfcrowdfunding/dsfcrowdfunding.dart';
import 'package:dsfcrowdfunding/dsfcrowdfunding_platform_interface.dart';
import 'package:dsfcrowdfunding/dsfcrowdfunding_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDsfcrowdfundingPlatform
    with MockPlatformInterfaceMixin
    implements DsfcrowdfundingPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DsfcrowdfundingPlatform initialPlatform = DsfcrowdfundingPlatform.instance;

  test('$MethodChannelDsfcrowdfunding is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDsfcrowdfunding>());
  });

  test('getPlatformVersion', () async {
    Dsfcrowdfunding dsfcrowdfundingPlugin = Dsfcrowdfunding();
    MockDsfcrowdfundingPlatform fakePlatform = MockDsfcrowdfundingPlatform();
    DsfcrowdfundingPlatform.instance = fakePlatform;

    expect(await dsfcrowdfundingPlugin.getPlatformVersion(), '42');
  });
}
