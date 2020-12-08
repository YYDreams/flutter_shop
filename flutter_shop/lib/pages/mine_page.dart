import 'package:flutter/material.dart';
import '../pages/user_page/user_top.dart';
import '../pages/user_page/user_order.dart';
import '../pages/user_page/user_item.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: ListView(
        children: <Widget>[
          UserTopPage(),
          UserOrderPage(),
          UserItem(),
        ],
      ),
    );
  }

}
//
//// 头像已经昵称
//class UserHeaderView extends StatelessWidget{
//
// final Map userInfo;
//
// UserHeaderView({Key key, this.userInfo}) : super(key: key);
//
//
// @override
//  Widget build(BuildContext context) {
//    return InkWell(
//
//      child: Container(
//       height:ScreenUtil().setHeight(100),
//
//        child: Row(
//
//crossAxisAlignment:CrossAxisAlignment.center,
//mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//
//             Padding(padding: EdgeInsets.only(top: 20.0)),
//
//             Image.network(userInfo["images"],
//
//             ),
//             Padding(padding: EdgeInsets.only(left: 20.0)),
//            Text(userInfo["userName"],style: TextStyle(
//              color: Colors.black,
//            ),),
//
//          ],
//
//
//        ),
//
//
//      ),
//
//
//    );
//  }
