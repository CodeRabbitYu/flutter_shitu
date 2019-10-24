///
/// Create by Rabbit on 2019/09/29.
///

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shitu/models/news/index.dart';

import 'package:flutter_shitu/models/index.dart' as model;
import 'package:flutter_shitu/pages/news/widgets/index.dart';
import 'package:flutter_shitu/utils/image_clipper.dart';
import 'package:flutter_shitu/utils/request.dart';
// import 'package:flutter_shitu/models/news/new_json.dart';
// import 'package:flutter_shitu/models/index.dart';
import 'dart:convert';
import 'dart:core';

import 'dart:ui' as ui;
import 'dart:async';

import 'package:pull_to_refresh/pull_to_refresh.dart';

// const String pic =
//     'http://pic75.nipic.com/file/20150821/9448607_145742365000_2.jpg';

const String pic =
    'http://wimg.spriteapp.cn/ugc/2019/10/19/5daa4d034c94b_1.jpg';

class News extends StatefulWidget {
  News({Key key}) : super(key: key);

  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List _newsList = [];

  NewsModel newsModel;
  List clipperImages = [];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ImageClipper clipper;

  @override
  Widget build1(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImageClipper'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Container(
                  color: Colors.grey,
                  child: Image.network(
                    pic,
                    fit: BoxFit.fill,
                  )),
              width: 200,
              height: 150,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                color: Colors.green,
                child: CustomPaint(
                  painter: clipper,
                  size: Size(150, 150),
                )),
            RaisedButton(child: Text('Clip'), onPressed: () => clip())
          ],
        ),
      ),
    );
  }

  Future<ui.Image> _loadImge() async {
    ImageStream imageStream = NetworkImage(pic).resolve(ImageConfiguration());
    Completer<ui.Image> completer = Completer<ui.Image>();

    void imageListener(ImageInfo info, bool synchronousCall) {
      ui.Image image = info.image;
      print('info.image ---- ${info.image}');
      completer.complete(image);
      imageStream.removeListener(ImageStreamListener(imageListener));
    }

    imageStream.addListener(ImageStreamListener(imageListener));
    return completer.future;
  }

  clip() async {
    ui.Image uiImage;

    var image = await _loadImge();
    //  uiImage = image;
    clipper = ImageClipper(image);

    setState(() {});

    // _loadImge().then((image) {
    //   uiImage = image;
    // }).whenComplete(() {
    //   print('---- $uiImage');
    //   clipper = ImageClipper(uiImage);
    //   print('ImageClipper---- $uiImage ---- $clipper');

    //   setState(() {});
    // });
  }

  @override
  void initState() {
    super.initState();

    newsModel = NewsModel();

    this.loadData();
  }

  Future loadData() async {
    newsModel.loadNewsData((newsData, clippers) {
      this.setState(() {
        _newsList = newsData.list;
        clipperImages = clippers;
      });
    });
  }

  void _onRefresh() async {
    this.loadData();

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // _newsList.add((_newsList.length + 1).toString());
    // if (mounted) setState(() {});
    // _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    print('build --------- News ---- `${_newsList.length}`');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('百思不得姐'),
        ),
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: BezierCircleHeader(),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text("pull up load");
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = Text("Load Failed!Click retry!");
              } else if (mode == LoadStatus.canLoading) {
                body = Text("release to load more");
              } else {
                body = Text("No more Data");
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            itemBuilder: (c, i) => Container(
              child:
                  NewsItem(item: _newsList[i], clipperImage: clipperImages[i]),
            ),
            // itemExtent: 100.0,
            itemCount: _newsList.length,
          ),
        ),
      ),
    );
  }
}
