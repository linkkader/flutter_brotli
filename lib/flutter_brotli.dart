
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'generated_bindings.dart';

//https://groups.google.com/g/flutter-dev/c/LLWPwBJLizc/m/yOs6kXuKAQAJ
extension Uint8ListBlobConversion on Uint8List {
  /// Allocates a pointer filled with the Uint8List data.
  Pointer<Uint8> allocatePointer() {
    final blob = calloc<Uint8>(length);
    final blobBytes = blob.asTypedList(length);
    blobBytes.setAll(0, this);
    return blob;
  }
}

class FlutterBrotli{
  static late CBrotli _brotli;
  static bool _isInit = false;

  static final FlutterBrotli _instance = FlutterBrotli._internal();
  factory FlutterBrotli() => _instance;
  FlutterBrotli._internal();

  static FlutterBrotli init(){
    assert(!_isInit, "Brotli is already initialized");
    _isInit = true;
    var path = "brotli.so";
    if (Platform.isMacOS){
      path = "brotli.dylib";
    }else if (Platform.isWindows){
      path = "brotli.dll";
    }
    final DynamicLibrary nativeAddLib = Platform.isAndroid
        ? DynamicLibrary.open('libbrotli.so')
        : DynamicLibrary.process();
    _brotli = CBrotli(nativeAddLib);
    return _instance;
  }

  static Future<Uint8List> compress(String str) async {
    assert(_isInit, "Brotli is not initialized");
    var tempPath = "${Directory.systemTemp.path}/";
    print(tempPath);
    _brotli.myCompress(str.toNativeUtf8().cast<Char>(), tempPath.toNativeUtf8().cast<Char>());
    print("success");
    var out = File("${tempPath}out");
    assert(out.existsSync(), "File not found");
    var read = await out.readAsBytes();
    out.deleteSync();
    return read;
  }

  static Future<String> decompress(Uint8List lst) async {
    assert(_isInit, "Brotli is not initialized");
    var tempPath = "${Directory.systemTemp.path}/";
    print(tempPath);
    _brotli.myDeCompress(lst.allocatePointer(), lst.length, tempPath.toNativeUtf8().cast<Char>());
    var out = File("${tempPath}out");
    assert(out.existsSync(), "File not found");
    var read = await out.readAsString();
    out.deleteSync();
    return read;
  }
}