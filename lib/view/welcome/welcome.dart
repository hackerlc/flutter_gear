import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_app/view/home/home.dart';

class WelcomeView extends StatefulWidget{
  @override
  WelcomeState createState() => new WelcomeState();
}

class WelcomeState extends State<WelcomeView>{

  Timer _t;
  @override
  void initState() {
    super.initState();
    _t = Timer(const Duration(milliseconds: 3000), () {
      try{
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => HomeView()),
            (Route route) => route == null);
      }catch(e){}
    });
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 255, 69, 14),
      child: Container(
        padding: const EdgeInsets.only(top: 150.0),
        child: Column(
          children: <Widget>[
            Text(
              "浙财宝",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}