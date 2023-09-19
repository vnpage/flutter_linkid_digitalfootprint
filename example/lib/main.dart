import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_linkid_digitalfootprint/text_field_watcher.dart';
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
    FlutterLinkidDigitalFootprint.shared.setShowLog(true);
    FlutterLinkidDigitalFootprint.shared.initService(
        tenantId: "1",
        apiKey: "96c3bd74-ba62-46b3-bfdc-cee0ad902639",
        url: "https://digitalfootprint-test.linkid.vn");
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Running on'),
              TextFieldWatcher(
                name: 'name01',
                focusNode: focusNode,
                inputBuilder: (context, handle) => TextField(
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    handle.call(value);
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter your word"),
                ),
              ),
              TextFieldWatcher(
                inputBuilder: (context, handle) {
                  return TextField(
                    onChanged: (text) {
                      handle(text);
                    },
                  );
                },
                name: 'name02',
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("Tuan"))
            ],
          ),
        ),
      ),
    );
  }
}
