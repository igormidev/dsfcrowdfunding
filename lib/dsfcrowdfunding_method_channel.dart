import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dsfcrowdfunding_platform_interface.dart';

/// An implementation of [DsfcrowdfundingPlatform] that uses method channels.
class MethodChannelDsfcrowdfunding extends DsfcrowdfundingPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dsfcrowdfunding');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
