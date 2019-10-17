/**
* @flow
* Created by Rabbit on 2019/09/27.
*/

import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build --------- Main');

    return Container(
      child: Text('1111'),
    );
  }
}
