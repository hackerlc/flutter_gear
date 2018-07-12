// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'view/welcome/welcome.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
//  debugPaintSizeEnabled = false;
  runApp(MyAPP());
}

/*
* StatelessWidget 这是一个没有状态的widget 因为这个app的欢迎页面不需要状态的改变
* 所以继承 StatelessWidget
* */

class MyAPP extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "浙财宝",
      theme: ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: Color.fromARGB(255, 0, 215, 198),
        accentColor: Colors.cyan[300],
      ),
      home: WelcomeView(),
    );
  }

}

