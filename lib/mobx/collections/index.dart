import 'package:flutter/material.dart';
import 'package:flutter_shitu/models/index.dart';
import 'package:flutter_shitu/utils/image_clipper.dart';
import 'package:flutter_shitu/utils/request.dart';

import 'package:flutter_shitu/models/collections/collections.dart';

import 'package:mobx/mobx.dart';

import 'dart:ui' as ui;
import 'dart:async';

part 'index.g.dart';

class CollectionsMobx = _CollectionsMobx with _$CollectionsMobx;

/// 先使用回调的方式来更新页面，之后会集成redux或者mobx来做数据管理
abstract class _CollectionsMobx with Store {
  @observable
  CollectionsModel newsData;

  @observable
  List clippers = [];

  @observable
  String maxid = '';

  loadNewsData() async {
    final newData = await request
        .get('http://api.budejie.com/api/api_open.php?a=list&c=data&type=');

    newsData = CollectionsModel.fromJson(newData.data);

    maxid = newsData.info.maxid;
    Size physicalSize = ui.window.physicalSize;

    for (var news in newsData.list) {
      if (double.parse(news.height) > physicalSize.height &&
          news.is_gif == 0.toString()) {
        var img = await handleImage(news.cdn_img);
        var clipperImage = ImageClipper(img);
        clippers.add(clipperImage);
      } else {
        clippers.add(null);
      }
    }

    return newsData;
  }

  Future<ui.Image> handleImage(pic) async {
    ImageStream imageStream = NetworkImage(pic).resolve(ImageConfiguration());
    Completer<ui.Image> completer = Completer<ui.Image>();

    void imageListener(ImageInfo info, bool synchronousCall) {
      ui.Image image = info.image;
      // print('info.image ---- ${info.image}');
      completer.complete(image);
      imageStream.removeListener(ImageStreamListener(imageListener));
    }

    imageStream.addListener(ImageStreamListener(imageListener));
    return completer.future;
  }
}
