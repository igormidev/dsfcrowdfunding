import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dsfcrowdfunding_method_channel.dart';

abstract class DsfcrowdfundingPlatform extends PlatformInterface {
  /// Constructs a DsfcrowdfundingPlatform.
  DsfcrowdfundingPlatform() : super(token: _token);

  static final Object _token = Object();

  static DsfcrowdfundingPlatform _instance = MethodChannelDsfcrowdfunding();

  /// The default instance of [DsfcrowdfundingPlatform] to use.
  ///
  /// Defaults to [MethodChannelDsfcrowdfunding].
  static DsfcrowdfundingPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DsfcrowdfundingPlatform] when
  /// they register themselves.
  static set instance(DsfcrowdfundingPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
