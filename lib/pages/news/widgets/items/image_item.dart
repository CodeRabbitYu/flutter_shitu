///
/// Create by Rabbit on 2019/10/20.
///

import 'package:flutter/material.dart';

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
    print('clipperImage ----- $clipperImage ----- $image');
    final size = MediaQuery.of(context).size;
    if (clipperImage != null) {
      return Container(
        alignment: Alignment.topLeft,
        // color: Colors.green,
        child: CustomPaint(
          painter: clipperImage,
          size: Size(size.width * 0.6, size.height * 0.6),
        ),
      );
    }

    return Container(
      alignment: Alignment.topLeft,
      child: Image.network(
        image,
        // height: 1000,
        // width: size.width * 0.88,
        // fit: BoxFit.fill,
      ),
    );
  }
}
