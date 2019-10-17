import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'router_tab.dart';

import 'package:flutter_shitu/routers/router_handler.dart';

class Routes {
  // static String root = "/";

  static String root = '/';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("没有找到当前路由 !!!");
      return;
    });
    // router.define(root, handler: shituHandler);
    router.define(root, handler: tabHandler);
  }
}
