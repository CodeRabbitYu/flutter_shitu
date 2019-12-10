import 'dart:ui' as prefix0;

///
/// Create by Rabbit on 2019/10/20.
///

import 'package:flutter/material.dart';
import 'dart:ui';

class ImageItem extends StatelessWidget {
  const ImageItem(
      {Key key,
      this.image,
      this.imageHeight,
      this.imageWidth,
      this.clipperImage})
      : super(key: key);
  final String image;
  final double imageHeight;
  final double imageWidth;
  final clipperImage;

  @override
  Widget build(BuildContext context) {
    // print('clipperImage ----- $clipperImage ----- $image');
    final size = MediaQuery.of(context).size;
    Size physicalSize = window.physicalSize / window.devicePixelRatio;

    // print('-------- ${imageWidth / physicalSize.width}');

    if (clipperImage != null) {
      return Container(
        alignment: Alignment.topLeft,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            CustomPaint(
              painter: clipperImage,
              size: Size(physicalSize.width * 0.6, physicalSize.height * 0.6),
            ),
            Positioned(
              bottom: 0.0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                child: Text(
                  '长图',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    if (image != null) {
      return Container(
        alignment: Alignment.topLeft,
        child: Image.network(
          image,
          // height: 1000,
          // width: size.width * 0.88,
          fit: BoxFit.fill,
        ),
      );
    }
    return Container();
  }
}
