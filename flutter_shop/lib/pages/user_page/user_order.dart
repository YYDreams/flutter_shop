import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      color: Colors.white,
      height: ScreenUtil().setHeight(180),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _setupOrderHeaderWidget(),
          _setupLineWidget(),
          _setupOrderItemWidget(),
        ],
      ),
    );
  }

  ///全部订单
  Widget _setupOrderHeaderWidget() {
    return InkWell(
      onTap: () {
        //TODO  全部订单
        print('全部订单');
      },
      child: Container(
        height: ScreenUtil().setHeight(80),
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('我的订单'),
            Row(
              children: [
                Text(
                  '全部订单',
                ),
                Image.asset(
                  "assets/images/arrow_right.png",
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  ///设置分割线
  Widget _setupLineWidget() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(244, 245, 245, 1.0),
          ),
        ),
      ),
    );
  }

  ///设置子订单
  Widget _setupOrderItemWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setuoItem('user_unpay', '待付款', () {}),
          _setuoItem('user_unsend', '待发货', () {}),
          _setuoItem('user_unreceive', '待收货', () {}),
          _setuoItem('user_message', '待评价', () {}),
          _setuoItem('user_returned', '退换货', () {}),
        ],
      ),
    );
  }

  //

  Widget _setuoItem(String images, String title, VoidCallback callback) {
    return Container(
        width: (ScreenUtil.screenWidthDp - 30) / 5,
        height: ScreenUtil().setHeight(100) - 1,
        child: InkWell(
          onTap: () {
            callback();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/${images}.png",
                width: 30,
                height: 20,
              ),
              SizedBox(
                height: 5,
              ),
              Text('${title}'),
            ],
          ),
        ));
  }
}
