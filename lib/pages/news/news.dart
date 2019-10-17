import 'package:dio/src/response.dart';

///
/// Create by Rabbit on 2019/09/29.
///

import 'package:flutter/material.dart';
import 'package:flutter_shitu/models/index.dart';
import 'package:flutter_shitu/utils/request.dart';
// import 'package:flutter_shitu/models/news/new_json.dart';
// import 'package:flutter_shitu/models/index.dart';
import 'dart:convert';
import 'dart:core';

class News extends StatefulWidget {
  News({Key key}) : super(key: key);

  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  var _newsList = [];

  @override
  void initState() {
    super.initState();

    this.loadNewsData();
  }

  Future loadNewsData() async {
    final newData = await request
        .get('http://api.budejie.com/api/api_open.php?a=list&c=data&type=');

    // var _news = json.decode(newData.toString());

    New_json newsData = New_json.fromJson(newData.data);

    // New_json_list newsList = New_json_list.fromJson(newsData.list);

    List newsList = newsData.list;

    List _list = newsData.list
        .map((item) => {New_json_list.fromJson(item.toJson())})
        .toList();
    print(newsList[0].text);

    this.setState(() {
      _newsList = newsData.list;
    });

    print(_newsList.length);

    // var _llll = _list.map((item) => {print('------ `${item.text}`')});

    // print(_llll.length);
  }

  @override
  Widget build(BuildContext context) {
    print('build --------- News ---- `${_newsList.length}`');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('百思不得姐'),
        ),
        body: ListView.builder(
          itemCount: _newsList.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text('${_newsList[index].text}'),
            );
          },
        ),
      ),
    );
  }
}
