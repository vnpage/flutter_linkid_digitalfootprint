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
    initSDK();
  }

  void initSDK() async {
    FlutterLinkidDigitalFootprint.shared.setShowLog(true);
    FlutterLinkidDigitalFootprint.shared.setCurrentScreen("Test01", data: {"bundle_reg_input_phone_number": "0935722589"});
    FlutterLinkidDigitalFootprint.shared.initService(
        tenantId: "1",
        apiKey: "96c3bd74-ba62-46b3-bfdc-cee0ad902639",
        url: "https://digitalfootprint-test.linkid.vn");
    FlutterLinkidDigitalFootprint.shared.setReferralId("112233445566");

    focusNode.addListener(() {
      print("tuandv8 = ${focusNode.hasFocus}");
      setState(() {

      });
    });
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
                secure: false,
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
                    FlutterLinkidDigitalFootprint.shared
                        .logEvent("TestEvent01", data: {'ten': "Tuan", "dienthoai": "888888888"});
                  },
                  child: const Text("Log Event")),
              ElevatedButton(
                  onPressed: () {
                    FlutterLinkidDigitalFootprint.shared.setCurrentScreen(
                      "Screen01",
                        data: {'bundle_reg_input_phone_number': '99999999', 'hovaten': 'khanh'}
                    );
                  },
                  child: const Text("Start Current Screen")),
              ElevatedButton(
                  onPressed: () {
                    FlutterLinkidDigitalFootprint.shared
                        .startScreenFlow("Screen01");
                  },
                  child: const Text("Start Screen Flow")),
              ElevatedButton(
                  onPressed: () {
                    FlutterLinkidDigitalFootprint.shared
                        .endScreenFlow("Screen01", data: {'screenKey': 1, 'bundle_reg_input_phone_number': '0966370710'});
                  },
                  child: const Text("End Screen Flow"))
            ],
          ),
        ),
      ),
    );
  }
}
