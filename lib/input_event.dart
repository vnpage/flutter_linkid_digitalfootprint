import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'flutter_linkid_digitalfootprint_platform_interface.dart';

class InputEventHolder {
  static final InputEventHolder _shared = InputEventHolder._internal();

  factory InputEventHolder() {
    return _shared;
  }

  InputEventHolder._internal();

  _InputEvent? _currentEvent;

  void init(String name) {
    if (_currentEvent != null && _currentEvent?.name != name) {
      saveEvent(_currentEvent!.name);
    }
    if (_currentEvent == null || _currentEvent?.name != name) {
      _currentEvent = _InputEvent();
      _currentEvent?.init(name);
    }
  }

  void setInputValue(String value) {
    _currentEvent?.inputValue = value;
  }

  String? getInputValue() {
    return _currentEvent?.inputValue;
  }

  void saveEvent(String name) {
    // print("call save event $name ${_currentEvent?.name}");
    if (name == _currentEvent?.name) {
      _currentEvent?.saveEvent();
      _currentEvent = null;
    }
  }

  void keyPressed(bool backspace) {
    _currentEvent?.keyPressed(backspace);
  }
}

class _InputEvent {
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
    if (name.isNotEmpty == false) {
      return;
    }
    this.name = name;
    var uuid = const Uuid();
    id = uuid.v4();
  }

  void keyPressed(bool backspace) {
    if (name.isNotEmpty == false) {
      return;
    }
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
    if (name.isNotEmpty == false) {
      return;
    }
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
      "localId": id,
    };
    if (keyCount > 1) {
      try {
        data["avgTypeSpeed"] =
            ((keyCount.toDouble() / (end - start).toDouble()) * 60000).toInt();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
      try {
        data["minTypeSpeed"] = ((2.0 / maxPer2Key.toDouble()) * 60000).toInt();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
      try {
        data["maxTypeSpeed"] = ((2.0 / minPer2Key.toDouble()) * 60000).toInt();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      data["avgTypeSpeed"] = 1;
      data["minTypeSpeed"] = 1;
      data["maxTypeSpeed"] = 1;
    }
    if (kDebugMode) {
      print(data);
    }
    return data;
  }
}
