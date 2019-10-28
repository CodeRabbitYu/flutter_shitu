/**
* @flow
* Created by Rabbit on 2019/09/27.
*/

import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shitu/stores/shitu/index.dart';

class Mine extends StatefulWidget {
  Mine({Key key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ShiTuStore>(context);

    // print('mine ---- $store ++++++ ${store.imageUrl}');

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('我的')),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('点击更改'),
                  onPressed: () {
                    store.setImageUrl(
                        'https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg');
                  },
                )
              ],
            ),
          )),
    );
  }
}
