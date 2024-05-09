#include "include/wapas/wapas_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "wapas_plugin.h"

void WapasPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  wapas::WapasPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
