import 'dart:ui';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_shitu/stores/shitu/index.dart';

class ShiTu extends StatefulWidget {
  ShiTu({Key key}) : super(key: key);
  @override
  _ShiTuState createState() => _ShiTuState();
}

class _ShiTuState extends State<ShiTu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build --------- ShiTu');

    ShiTuStore store = Provider.of<ShiTuStore>(context);

    // print('shitu_store ---- $store ++++++ ${store.imageUrl}');

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final tween = MultiTrackTween([
      Track("size").add(Duration(seconds: 4), Tween(begin: 0.0, end: 150.0)),
      Track("color")
          .add(Duration(seconds: 2),
              ColorTween(begin: Colors.red, end: Colors.blue),
              curve: Curves.easeIn)
          .add(Duration(seconds: 2),
              ColorTween(begin: Colors.blue, end: Colors.green),
              curve: Curves.easeOut),
      Track("rotation").add(Duration(seconds: 1), ConstantTween(0.0)).add(
          Duration(seconds: 3), Tween(begin: 0.0, end: pi / 2),
          curve: Curves.easeOutSine),
      Track('padding').add(
          Duration(milliseconds: 500),
          Tween(
              begin: EdgeInsets.only(left: 0),
              end: EdgeInsets.only(left: width / 2 - 50)),
          curve: Curves.fastOutSlowIn),
    ]);

    return Observer(
      builder: (_) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('识兔'),
          ),
          body: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Image.network(
                store.imageUrl,
                fit: BoxFit.fitHeight,
                // alignment: Alignment.topCenter,
                height: height,
                // width: width,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
              ControlledAnimation(
                playback: Playback.PLAY_FORWARD,
                duration: tween.duration,
                // duration: Duration(milliseconds: 500),
                tween: tween,
                curve: Curves.bounceOut,

                builder: (context, animation) {
                  return Container(
                    margin: animation['padding'],
                    width: 100,
                    height: 44,
                    // color: animation["color"],
                    child: RaisedButton(
                      child: Text(
                        '点我搜索',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // await showDeleteConfirmDialog1('222222');
                      },
                      color: Colors.lightBlue,
                      shape: StadiumBorder(),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1(text) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('$text'),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
