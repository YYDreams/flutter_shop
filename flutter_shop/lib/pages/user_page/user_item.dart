import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_shop/config/common_widget.dart';
class UserItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          _setupItem('购物卡', '', true),
          _setupItem('设置', '', false),
          kCommon().setupLineWidget(),
          _setupItem('帮助中心', '', true),
          _setupItem('在线客服', '', true),
          _setupItem('用户反馈', '', false),
        ],
      ),
    );
  }
  Widget _setupItem(String title, String subTitle, bool showBorder) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: showBorder ? 0.5 : 0.0,
            color: showBorder ? kColor.defalutBorderColor : Colors.white,
          ),
        ),
      ),
      padding: EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
