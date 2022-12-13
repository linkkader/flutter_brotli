import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_brotli/flutter_brotli.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  void initState() {
    FlutterBrotli.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final compressed = await FlutterBrotli.compress('Hello World');
            final decompressed = await FlutterBrotli.decompress(compressed);
            print('Compressed: $compressed');
            print('Decompressed: $decompressed');
          },
          child: const Icon(Icons.add),
        ),
        body: const Center(
          child: Text('Running on: \n'),
        ),
      ),
    );
  }
}
