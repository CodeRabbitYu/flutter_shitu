import 'package:flutter/material.dart';
import 'package:flutter_shitu/config/application.dart';
import 'package:flutter_shitu/routers/router.dart';

class Launch extends StatefulWidget {
  Launch({Key key}) : super(key: key);

  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  void initState() {
    super.initState();
    print('initState --------- Launch');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            child: Image.asset(
              'assets/splash.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Container(
              // padding: EdgeInsets.only(bottom: 150),
              child: Image.network(
                'https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg',
                // fit: BoxFit.
                fit: BoxFit.cover,
              ),
              height: size.height * 0.7,
              width: size.width,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(size.width - 100, 80, 0, 0),
            // color: Colors.grey,
            child: FlatButton(
              color: Colors.blueAccent,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                '点我跳转',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Application.router.navigateTo(context, Routes.root);
              },
            ),
          ),
        ],
      ),
    );
  }
}
