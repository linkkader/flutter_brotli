import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_brotli_method_channel.dart';

abstract class FlutterBrotliPlatform extends PlatformInterface {
  /// Constructs a FlutterBrotliPlatform.
  FlutterBrotliPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterBrotliPlatform _instance = MethodChannelFlutterBrotli();

  /// The default instance of [FlutterBrotliPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterBrotli].
  static FlutterBrotliPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterBrotliPlatform] when
  /// they register themselves.
  static set instance(FlutterBrotliPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
