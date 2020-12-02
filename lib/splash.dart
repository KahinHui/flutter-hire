import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hire/common/Config.dart';
import 'package:hire/main.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashState();
}

class SplashState extends State<SplashPage> {
  Timer _t;

  @override
  void initState() {
    super.initState();
    _t = new Timer(const Duration(milliseconds: 1500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder<Null>(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: new MyHomePage(
                        title: "flutter",
                      ),
                    );
                  },
                );
              },
              transitionDuration: Duration(milliseconds: 300),
            ),
            (route) => route == null);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Config.GLOBAL_COLOR,
      child: Container(
        alignment: Alignment(0, -0.3),
        child: new Text("招聘",
            style: new TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold),
            textDirection: TextDirection.ltr),
      ),
    );
  }
}
