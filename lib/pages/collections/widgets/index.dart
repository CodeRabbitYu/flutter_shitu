import 'dart:async';

///
/// Create by Rabbit on 2019/10/17.
///

import 'package:flutter/material.dart';
import 'package:flutter_shitu/models/index.dart';
import 'package:flutter_shitu/pages/collections/widgets/items/index.dart';
import 'package:flutter_shitu/pages/collections/widgets/user_info.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key key, this.item, this.clipperImage}) : super(key: key);

  final CollectionsList item;
  final clipperImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          UserInfo(
              profileImage: item.profile_image,
              name: item.name,
              userInfoTap: () {
                print('UserInfoTap --- ');
              }),
          ContentItem(item: item, clipperImage: clipperImage),
        ],
      ),
    );
  }
}
