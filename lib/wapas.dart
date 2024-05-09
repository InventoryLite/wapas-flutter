
import 'wapas_platform_interface.dart';

class Wapas {
  Future<String?> getPlatformVersion() {
    return WapasPlatform.instance.getPlatformVersion();
  }
}
