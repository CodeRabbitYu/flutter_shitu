///
/// Create by Rabbit on 2019/10/20.
///

import 'package:flutter/material.dart';
import 'package:flutter_shitu/models/index.dart';
import 'package:flutter_shitu/pages/collections/widgets/items/image_item.dart';
import 'package:flutter_shitu/pages/collections/widgets/items/text_item.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({Key key, this.item, this.clipperImage, this.itemTap})
      : super(key: key);

  final CollectionsList item;
  final clipperImage;
  final itemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextItem(text: item.text),
            ImageItem(
              image: item.cdn_img,
              imageHeight: double.parse(item.height),
              imageWidth: double.parse(item.width),
              clipperImage: clipperImage,
            ),
          ],
        ),
        onTap: () {
          itemTap();
        },
      ),
    );
  }
}
