import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'wapas_platform_interface.dart';

/// An implementation of [WapasPlatform] that uses method channels.
class MethodChannelWapas extends WapasPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wapas');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
