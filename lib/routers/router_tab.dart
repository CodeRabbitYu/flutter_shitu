/**
* Created by Rabbit on 2019/09/27.
*/
import 'package:flutter/material.dart';
import 'package:flutter_shitu/pages/mine/mine.dart';
import 'package:flutter_shitu/pages/news/news.dart';
import 'router_empty.dart';

import 'package:flutter_shitu/pages/shitu/shitu.dart';

class AppTab extends StatefulWidget {
  AppTab({Key key}) : super(key: key);

  _AppTabState createState() => _AppTabState();
}

class _Item {
  String title;
  Icon icon;

  _Item(this.title, this.icon);
}

class _AppTabState extends State<AppTab> {
  List<Widget> _tabPages = List();
  List<Widget> tabPages = [];

  int _currentIndex = 0;
  List tabData = [
    {'text': '识兔', 'icon': Icon(Icons.extension)},
    {'text': '关于手册', 'icon': Icon(Icons.import_contacts)},
    {'text': '个人中心', 'icon': Icon(Icons.account_circle)},
    //https://flutter-go.pub/api/isInfoOpen
  ];

  final itemNames = [
    _Item('首页', Icon(Icons.extension)),
    _Item('书影音', Icon(Icons.import_contacts)),
    _Item('我的', Icon(Icons.import_contacts))
  ];

  List<BottomNavigationBarItem> _myTabs = [];
  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          '',
        ),
      ));
    }
    // if (itemList == null) {
    //   itemList = itemNames.map(
    //     (item) => BottomNavigationBarItem(
    //       icon: item.icon,
    //       title: Text(
    //         item.title,
    //         style: TextStyle(fontSize: 10.0),
    //       ),
    //     ),
    //   );
    // }

    _tabPages..add(ShiTu())..add(Empty())..add(Empty());
    // _tabPages.addAll([ShiTu(), Empty(), Empty()]);
  }

  //Stack（层叠布局）+Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _currentIndex != index,
      child: TickerMode(
        enabled: _currentIndex == index,
        child: _tabPages[index],
      ),
    );
  }

  @override
  void didUpdateWidget(AppTab oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: renderAppBar(context, widget, _currentIndex),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _itemTapped,
        //shifting :按钮点击移动效果
        // fixed：固定
        // type: BottomNavigationBarType.fixed,

        fixedColor: Theme.of(context).primaryColor,
        showSelectedLabels: false,
        iconSize: 33,
      ),
    );
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 1 || index == 2) {
      var page = index == 1 ? News() : Mine();

      if (_tabPages[index] is ShiTu ||
          _tabPages[index] is News ||
          _tabPages[index] is Mine) return;

      _tabPages
        ..removeAt(index)
        ..insert(index, page);
    }

    // debugPrint('index ------ $index ---- $_tabPages');
  }
}
