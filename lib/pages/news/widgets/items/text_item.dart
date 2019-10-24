///
/// Create by Rabbit on 2019/10/20.
///

import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  const TextItem({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 15),
    );
  }
}
