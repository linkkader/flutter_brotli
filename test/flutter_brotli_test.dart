import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_brotli/flutter_brotli.dart';
import 'package:flutter_brotli/flutter_brotli_platform_interface.dart';
import 'package:flutter_brotli/flutter_brotli_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterBrotliPlatform
    with MockPlatformInterfaceMixin
    implements FlutterBrotliPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterBrotliPlatform initialPlatform = FlutterBrotliPlatform.instance;

  test('$MethodChannelFlutterBrotli is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterBrotli>());
  });

  test('getPlatformVersion', () async {
    FlutterBrotli flutterBrotliPlugin = FlutterBrotli();
    MockFlutterBrotliPlatform fakePlatform = MockFlutterBrotliPlatform();
    FlutterBrotliPlatform.instance = fakePlatform;

    expect(await flutterBrotliPlugin.getPlatformVersion(), '42');
  });
}
