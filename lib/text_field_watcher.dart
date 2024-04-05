import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkid_digitalfootprint/input_event.dart';

StreamSubscription setTimeout(Function callback, int milliseconds) {
  final future = Future.delayed(Duration(milliseconds: milliseconds));
  return future.asStream().listen((event) {}, onDone: () {
    callback();
  });
}

void clearTimeout(StreamSubscription subscription) {
  try {
    subscription.cancel();
  } catch (e) {
    // print(e.toString());
  }
}

typedef TextFieldBuilder = Widget Function(
    BuildContext context, Function(String text));

class TextFieldWatcher extends StatelessWidget {
  final String name;
  final FocusNode? focusNode;
  final TextFieldBuilder inputBuilder;
  final bool? secure;
  InputEventHolder inputEvent = InputEventHolder();

  void handleText(String text) {
    if ((inputEvent.getInputValue()?.length ?? 0) > text.length) {
      inputEvent.keyPressed(true);
    } else {
      inputEvent.keyPressed(false);
    }
    inputEvent.setInputValue(text);
  }

  TextFieldWatcher(
      {super.key,
      required this.name,
      this.focusNode,
      this.secure = false,
      required this.inputBuilder});

  @override
  Widget build(BuildContext context) {
    // if(focusNode != null) {
    //   focusNode?.addListener(() {
    //     print("$name ${focusNode!.hasFocus}");
    //     if (focusNode!.hasFocus == true) {
    //       inputEvent = InputEvent(name);
    //     } else {
    //       inputEvent?.saveEvent();
    //       inputEvent = null;
    //     }
    //   });
    //   return inputBuilder(context, handleText);
    // } else {
    return Focus(
      focusNode: focusNode,
      onFocusChange: (hasFocus) {
        // print("onFocusChange $name $hasFocus");
        if (hasFocus == true) {
          inputEvent.init(name, secure: secure ?? false);
        } else {
          inputEvent.saveEvent(name);
        }
      },
      child: inputBuilder(context, handleText),
    );
    // }
  }
}
