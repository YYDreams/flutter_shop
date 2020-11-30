
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/color.dart';


class UserOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      color: Colors.black12,
      height: ScreenUtil().setHeight(120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _setupOrderHeaderWidget(),
          _setupOrderItemWidget(),
        ],
      ),
    );
  }



  /*
   *
   */
  Widget _setupOrderHeaderWidget(){
    return InkWell(
      onTap: (){
        //TODO  全部订单
        print('全部订单');
      },
      child: Container(
        height: ScreenUtil().setHeight(60),
     margin: EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('我的订单'),
            Row(
              children: [
                Text('全部订单',),
                Image.asset("assets/images/../arrow_right.png",)
              ],
            )

          ],
        ),

      ),
    );
  }


  Widget _setupOrderItemWidget(){

    return Container(
      margin: EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setuoItem('','待付款',(){

          }),
          _setuoItem('','待发货',(){

          }),
          _setuoItem('','待收货',(){

          }),
          _setuoItem('','待评价',(){

          }),
          _setuoItem('','退换货',(){

          }),

        ],
      ),

    );
  }

  Widget _setuoItem(String images,String title,VoidCallback callback){


    return Container(
        width: (ScreenUtil.screenWidthDp - 30) / 5,
        color: Colors.orange,
        child: InkWell(
          onTap: () {
            callback();
          },
          child: Column(
            children: [
              Text('${images}'),
              Text('${title}'),
            ],
          ),
        ));
  }

//    return Column(
//
//      children: [
//        Icon(Icons.one_k),
//        Text('${title}'),
//
//      ],
//
//    );


}
