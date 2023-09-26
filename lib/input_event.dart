import 'dart:core';
import 'package:flutter/services.dart';
import 'package:flutter_linkid_digitalfootprint/flutter_linkid_digitalfootprint.dart';
import 'package:uuid/uuid.dart';

import 'flutter_linkid_digitalfootprint_platform_interface.dart';

class InputEvent {
  String id = "";
  String name = "";
  int keyCount = 0;
  int clearCount = 0;
  int start = 0;
  int end = 0;
  int minPer2Key = -1;
  int maxPer2Key = -1;
  String inputValue = "";

  void init(String name) {
    this.name = name;
    var uuid = const Uuid();
    id = uuid.v4();
  }

  void keyPressed(bool backspace) {
    if (start == 0) {
      start = DateTime.now().millisecondsSinceEpoch;
    }
    if (backspace) {
      // Backspace key was pressed
      clearCount++;
    } else {
      final now = DateTime.now().millisecondsSinceEpoch;
      keyCount++;
      if (end > 0) {
        final delta = now - end;
        if (minPer2Key <= 0 || (minPer2Key > delta)) {
          minPer2Key = delta;
        }
        if (maxPer2Key <= 0 || maxPer2Key < delta) {
          maxPer2Key = delta;
        }
      }
      end = now;
    }
  }

  void reset() {
    id = "";
    name = "";
    keyCount = 0;
    clearCount = 0;
    start = 0;
    end = 0;
    minPer2Key = -1;
    maxPer2Key = -1;
  }

  void saveEvent() {
    if (keyCount <= 0) {
      return;
    }
    FlutterLinkidDigitalfootprintPlatform.instance.saveInputEvent(toMap());
    reset();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "id": id,
      "displayName": name,
      "key": name,
      "noCorrections": clearCount,
      "beginInput": start,
      "endInput": end,
      "totalInput": end - start,
      "nameInput": name,
      "valueInput": inputValue,
    };
    if (keyCount > 1) {
      try {
        data["avgTypeSpeed"] =
            ((keyCount.toDouble() / (end - start).toDouble()) * 60000).toInt();
      } catch (e) {
        print(e);
      }
      try {
        data["minTypeSpeed"] = ((2.0 / maxPer2Key.toDouble()) * 60000).toInt();
      } catch (e) {
        print(e);
      }
      try {
        data["maxTypeSpeed"] = ((2.0 / minPer2Key.toDouble()) * 60000).toInt();
      } catch (e) {
        print(e);
      }
    } else {
      data["avgTypeSpeed"] = 1;
      data["minTypeSpeed"] = 1;
      data["maxTypeSpeed"] = 1;
    }
    print(data);
    return data;
  }
}
