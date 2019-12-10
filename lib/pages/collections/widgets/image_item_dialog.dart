///
/// Create by Rabbit on 2019/12/10.
///

import 'package:flutter/material.dart';
import 'package:flutter_shitu/models/index.dart';

class ImageItemDialog extends StatelessWidget {
  const ImageItemDialog({Key key, this.item, this.onTap}) : super(key: key);
  final CollectionsList item;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Image.network(
            item.cdn_img,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
