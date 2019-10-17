import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shitu/pages/main/main.dart';
import 'package:flutter_shitu/pages/shitu/shitu.dart';
import 'package:flutter_shitu/pages/launch/launch.dart';
import 'package:flutter_shitu/routers/router_tab.dart';

var tabHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new AppTab();
  },
);

var launchHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Launch();
  },
);

var shituHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new ShiTu();
  },
);

var mainHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Main();
  },
);
