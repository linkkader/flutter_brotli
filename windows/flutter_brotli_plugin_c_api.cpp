#include "include/flutter_brotli/flutter_brotli_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_brotli_plugin.h"

void FlutterBrotliPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_brotli::FlutterBrotliPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
