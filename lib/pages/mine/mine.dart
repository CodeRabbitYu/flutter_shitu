/**
* @flow
* Created by Rabbit on 2019/09/27.
*/

import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shitu/stores/shitu/shitu_store.dart';

class Mine extends StatefulWidget {
  Mine({Key key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ShiTuStore>(context);

    print('mine ---- $store ++++++ ${store.imageUrl}');

    return Container(
      child: Column(
        children: <Widget>[
          Text('Mine'),
          RaisedButton(
            child: Text('点击更新'),
            onPressed: () {
              store.setImageUrl(
                  'https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg');
            },
          )
        ],
      ),
    );
  }
}
