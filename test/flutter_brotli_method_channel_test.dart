import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_brotli/flutter_brotli_method_channel.dart';

void main() {
  MethodChannelFlutterBrotli platform = MethodChannelFlutterBrotli();
  const MethodChannel channel = MethodChannel('flutter_brotli');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
