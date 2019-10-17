import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build --------- Empty');
    return Container(
      child: Center(
        child: Text('111'),
      ),
    );
  }
}
