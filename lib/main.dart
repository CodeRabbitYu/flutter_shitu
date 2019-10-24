// flutter packages pub run build_runner build
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shitu/config/application.dart';
import 'package:flutter_shitu/mobx/clock/clock_widgets.dart';
import 'package:flutter_shitu/mobx/counter/counter_widgets.dart';
import 'package:flutter_shitu/mobx/hackernews/news_widgets.dart';
import 'package:flutter_shitu/mobx/multi_counter/multi_counter_store.dart';
import 'package:flutter_shitu/mobx/multi_counter/multi_counter_widgets.dart';
import 'package:flutter_shitu/mobx/random_stream/random_widgets.dart';
import 'package:flutter_shitu/mobx/todos/todo_widgets.dart';
import 'package:flutter_shitu/pages/launch/launch.dart';
import 'package:flutter_shitu/pages/mine/mine.dart';
import 'package:flutter_shitu/pages/news/news.dart';
import 'package:flutter_shitu/pages/shitu/shitu.dart';
import 'package:flutter_shitu/routers/router.dart';
import 'package:flutter_shitu/stores/shitu/shitu_store.dart';

import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            Provider<ShiTuStore>(
              builder: (_) => ShiTuStore(),
            ),
          ],
          child: MaterialApp(
            theme: ThemeData(backgroundColor: Colors.white),
            home: Scaffold(
              resizeToAvoidBottomPadding: false,
              body: Launch(),
            ),
            onGenerateRoute: Application.router.generator,
          ));
}

void main() => runApp(MyApp());
