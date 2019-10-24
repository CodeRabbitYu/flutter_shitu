import 'package:mobx/mobx.dart';

part 'shitu_store.g.dart';

class ShiTuStore = _ShiTuStore with _$ShiTuStore;

abstract class _ShiTuStore with Store {
  @observable
  String imageUrl =
      'http://ww1.sinaimg.cn/large/0065oQSqly1g2pquqlp0nj30n00yiq8u.jpg';

  @action
  setImageUrl(String url) {
    imageUrl = url;
  }
}
