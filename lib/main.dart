import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shitu/config/application.dart';
import 'package:flutter_shitu/pages/launch/launch.dart';
import 'package:flutter_shitu/routers/router.dart';

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.white),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Launch(),
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}

void main() => runApp(MyApp());
