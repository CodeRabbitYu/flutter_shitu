///
/// Create by Rabbit on 2019/10/17.
///
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key key,
    this.profileImage,
    this.name,
    this.userInfoTap,
  }) : super(key: key);

  final String profileImage;
  final String name;
  final GestureTapCallback userInfoTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        userInfoTap();
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(profileImage),
        ),
        title: Text(name),
      ),
    );
  }
}
