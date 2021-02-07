import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:hire/common/fluro/routes_handlers.dart';

class Routes {
  static String root ="/";
  static String home ="/home";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("FLURO ROUTE WAS NOT FOUND !!!");
      return null;
    });
    router.define(root, handler: rootHandler);
    router.define(home, handler: homeHandler);
  }
}