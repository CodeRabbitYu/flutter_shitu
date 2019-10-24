import 'package:flutter/material.dart';
import 'package:flutter_shitu/models/index.dart';
import 'package:flutter_shitu/utils/image_clipper.dart';
import 'package:flutter_shitu/utils/request.dart';

import 'dart:ui' as ui;
import 'dart:async';

/// 先使用回调的方式来更新页面，之后会集成redux或者mobx来做数据管理
class NewsModel {
  void loadNewsData(callBack) async {
    final newData = await request
        .get('http://api.budejie.com/api/api_open.php?a=list&c=data&type=');

    News newsData = News.fromJson(newData.data);

    List clippers = [];
    // print('newsData ---- $newsData');

    for (var news in newsData.list) {
      if (double.parse(news.height) > 2000 && news.is_gif == 0.toString()) {
        var img = await handleImage(news.cdn_img);
        var clipperImage = ImageClipper(img);
        clippers.add(clipperImage);
        // news.clipper = handleImage(news.cdn_img);
      } else {
        clippers.add(null);
      }
    }

    print('_clippers ---- ${clippers.length}');

    callBack(newsData, clippers);
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

  // Future<News> loadNewsData() async {
  //   final newData = await request
  //       .get('http://api.budejie.com/api/api_open.php?a=list&c=data&type=');

  //   News newsData = News.fromJson(newData.data);

  //   // Future.sync(newsData);

  //   return newsData;
  // }

}
