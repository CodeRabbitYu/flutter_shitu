import 'package:flutter/cupertino.dart';

///
/// Create by Rabbit on 2019/10/28.
///

import 'package:flutter/material.dart';
import 'package:flutter_shitu/mobx/index.dart';
import 'package:flutter_shitu/pages/collections/widgets/index.dart';
import 'package:flutter_shitu/utils/hex_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CollectionsList extends StatefulWidget {
  final num type;
  CollectionsList({Key key, this.type}) : super(key: key);

  @override
  _CollectionsListState createState() => _CollectionsListState();
}

class _CollectionsListState extends State<CollectionsList> {
  CollectionsMobx collectionsMobx;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  var _future;
  @override
  void initState() {
    super.initState();
    collectionsMobx = CollectionsMobx();
    _future = collectionsMobx.loadNewsData();

    print(widget.type);
  }

  _onRefresh() async {
    // await newsMobx.loadNewsData();
    collectionsMobx.loadNewsData();

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // _newsList.add((_newsList.length + 1)                            ====.toString());
    // if (mounted) setState(() {});
    // _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: _buildFuture,
      future: _future,
    );
  }

  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    // print('-----$context  ++++++ $snapshot');

    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');

        List _newsList = collectionsMobx.newsData.list;
        List clipperImages = collectionsMobx.clippers;
        return SmartRefresher(
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
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 10,
              );
            },
            // padding: EdgeInsets.only(top)
            itemBuilder: (context, index) => NewsItem(
              item: _newsList[index],
              clipperImage: clipperImages[index],
            ),
            itemCount: _newsList.length,
          ),
        );
      default:
        return null;
    }
  }
}
