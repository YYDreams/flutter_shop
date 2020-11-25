import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/color.dart';

class UserTopPage extends StatefulWidget {
  @override
  _UserTopPageState createState() => _UserTopPageState();
}

class _UserTopPageState extends State<UserTopPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(250),
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Stack(
        children: [
          setupRegisterOrLoginWidget(),
          Positioned(child: setupUserItemWidget(),bottom: 20,),
        ],

      ),
    );
  }

  /*
   *  顶部登录注册UI布局
   */
  Widget setupRegisterOrLoginWidget() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: InkWell(
        onTap: () {
          print('setupRegisterOrLoginWidget');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.face),
            Text('注册/登录',style: TextStyle(
              fontSize: 18,color: Colors.white,
            ),),
          ],
        ),
      ),
    );
  }

  /*
   *  顶部优惠券、我的收藏、我的评价布局
   */
  Widget setupUserItemWidget() {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          setupItemWidget(context, '优惠券', '-', () {
            print('优惠券');
          }),
          SizedBox(width: 5),
          setupItemWidget(context, '我的收藏', '-', () {
            print('我的收藏');
          }),
          SizedBox(width: 5),
          setupItemWidget(context, '我的评价', '-', () {
            print('我的评价');
          }),
        ],
      ),
    );
  }

  Widget setupItemWidget(
      BuildContext context, String title, String count, VoidCallback callback) {
    return Container(
        width: (ScreenUtil.screenWidthDp - 20) / 3,
        color: Colors.orange,
        child: InkWell(
          onTap: () {
            callback();
          },
          child: Column(
            children: [
              Text('${count}'),
              Text('${title}'),
            ],
          ),
        ));
  }
}
