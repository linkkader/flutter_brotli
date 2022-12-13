import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_brotli_platform_interface.dart';

/// An implementation of [FlutterBrotliPlatform] that uses method channels.
class MethodChannelFlutterBrotli extends FlutterBrotliPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_brotli');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
