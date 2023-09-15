import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_linkid_digitalfootprint/flutter_linkid_digitalfootprint.dart';

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
    super.initState();
    // initPlatformState();
    FlutterLinkidDigitalFootprint.shared.initService(
        tenantId: "1",
        apiKey: "8c76295a-a977-4d14-b400-d1e8ea87e617",
        url: "https://digitalfootprint-test.linkid.vn");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('Running on'),
        ),
      ),
    );
  }
}
