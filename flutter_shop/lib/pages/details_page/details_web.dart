import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/goods_detail_provide.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsWebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var goodsDetail  = Provide.value<GoodsDetailProvide>(context).goodsInfo.data.goodInfo.goodsDetail;


      return Provide<GoodsDetailProvide>(

        builder: (content,child,value){

          var isLeft  = Provide.value<GoodsDetailProvide>(context).isLeft;

          if(isLeft){

            return Container(
              height: MediaQuery.of(context).size.height - ScreenUtil().setHeight(120),
              child:  Html(
                 data: goodsDetail,

              ),


            );
          }else{
           return Container(
            width: MediaQuery.of(context).size.width,
             alignment: Alignment.center,
            child: Text(
              "暂无数据",
            ),
           );
          }


        },

      );
//    return Container();
  }
}
