import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wapas_method_channel.dart';

abstract class WapasPlatform extends PlatformInterface {
  /// Constructs a WapasPlatform.
  WapasPlatform() : super(token: _token);

  static final Object _token = Object();

  static WapasPlatform _instance = MethodChannelWapas();

  /// The default instance of [WapasPlatform] to use.
  ///
  /// Defaults to [MethodChannelWapas].
  static WapasPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WapasPlatform] when
  /// they register themselves.
  static set instance(WapasPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
