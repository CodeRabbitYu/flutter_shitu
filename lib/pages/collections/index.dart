///
/// Create by Rabbit on 2019/09/29.
///

import 'package:flutter/material.dart';
import 'package:flutter_shitu/pages/collections/collections_list.dart';

import 'package:flutter_shitu/routers/router_empty.dart';
import 'package:flutter_shitu/widgets/keep_alive/index.dart';
// import 'package:flutter_shitu/models/news/new_json.dart';
// import 'package:flutter_shitu/models/index.dart';import 'dart:core';

class TopTabBar {
  const TopTabBar({this.title, this.icon, this.type});
  final String title;
  final IconData icon;
  final num type;
}

const List<TopTabBar> _topTabBar = const <TopTabBar>[
  const TopTabBar(title: '全部', icon: Icons.directions_car, type: 1),
  const TopTabBar(title: '视频', icon: Icons.directions_bike, type: 41),
  const TopTabBar(title: '图片', icon: Icons.directions_boat, type: 10),
  const TopTabBar(title: '笑话', icon: Icons.directions_boat, type: 29),
];

class Collections extends StatefulWidget {
  Collections({Key key}) : super(key: key);

  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  String title = '百思不得姐';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: _topTabBar.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(title),
            bottom: TabBar(
              isScrollable: false,
              tabs: _topTabBar.map(
                (TopTabBar tabBar) {
                  return Tab(
                    text: tabBar.title,
                    icon: Icon(tabBar.icon),
                  );
                },
              ).toList(),
            ),
          ),
          body: TabBarView(
            children: _topTabBar.map(
              (TopTabBar tabbar) {
                return KeepAliveWidget(CollectionsList(
                  type: tabbar.type,
                ));
              },
            ).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            child: Text('更新'),
            onPressed: () {
              this.setState(() {
                title = title + '1';
              });
            },
          ),
        ),
      ),
    );
  }
}
