import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/// 图片裁剪
class ImageClipper extends CustomPainter {
  final ui.Image image;
  final double left;
  final double top;
  final double right;
  final double bottom;

  ImageClipper(this.image,
      {this.left = 0, this.top = 0, this.right = 1.0, this.bottom = 0.6});
  @override
  void paint(Canvas canvas, Size size) {
    print('physicalSize ---- ${ui.window.physicalSize}');

    // print('$image ---- $left ---- $top ---- $right ---- $bottom');
    print('image ---- $image ---- ${image.width} ---- ${image.width}');

    Size physicalSize = ui.window.physicalSize;

    // print('$size ---- ${size.width} ---- ${size.width}');

    // TODO: implement paint
    Paint paint = Paint();
    canvas.drawImageRect(
        image,
        Rect.fromLTRB(image.width * left, image.height * top, image.width * 1.0,
            physicalSize.height * 1.0),
        // Rect.fromLTRB(0, 0, 0, image.height *)
        Rect.fromLTWH(0, 0, size.width, size.height),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
