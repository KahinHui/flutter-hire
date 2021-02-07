import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:hire/main.dart';
import 'package:hire/splash.dart';

var rootHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SplashPage();
});

var homeHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MyHomePage();
});
