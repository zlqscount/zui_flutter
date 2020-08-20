import 'dart:async';

import 'package:flutter/material.dart';

///启动页
class SplashRoute extends StatefulWidget {
  Function CountDownEndListener;


  @override
  State<StatefulWidget> createState() {
    return _SplashState(CountDownEndListener);
  }

  SplashRoute(this.CountDownEndListener);
}

class _SplashState extends State {
  int countdown = 3;
  Function CountDownEndListener;

  _SplashState(this.CountDownEndListener);

  Timer countdownTimer;

  @override
  void initState() {
    super.initState();
    countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      if (countdown <= 0) {
        countdownTimer?.cancel();
        countdownTimer = null;
        CountDownEndListener();
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
           mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text("ZUI $countdown"), Image.asset("images/ic_flutter.png",width: 30, height: 30,)],
        ),
      ),
    );
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    countdownTimer = null;
    super.dispose();
  }
}
