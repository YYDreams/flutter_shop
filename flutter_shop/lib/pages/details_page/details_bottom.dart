import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import '../../provide/current_index_provide.dart';
class DetailBottonPage extends StatefulWidget {
  @override
  _DetailBottonPageState createState() => _DetailBottonPageState();
}

class _DetailBottonPageState extends State<DetailBottonPage> {
  @override
  Widget build(BuildContext context) {

    var detailInfoModel = Provide.value<GoodsDetailProvide>(context).goodsInfo.data.goodInfo;

    var  goodsId = detailInfoModel.goodsId;

    var  goodsName = detailInfoModel.goodsName;
//
//    var  goodsId = detailInfoModel.goodsId;
//    var  goodsId = detailInfoModel.goodsId;
//




    return Container(
     height:ScreenUtil().setHeight(120),

      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
            children: [
              InkWell(

                onTap: (){

                  Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                  Navigator.pop(context);

                },
                child: Container(
                  width: ScreenUtil().setWidth(110),
                  height:ScreenUtil().setHeight(80),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.black,
                  ),
                ),

              ),
              Positioned(
                top: 0, right: 10,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                    decoration: BoxDecoration(
                      color: kColor.primaryColor,
                      border: Border.all(width: 2,color: Colors.white),
                      //6 + 6  最大为12 设置再大无效果
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ),

              )),

            ],
          ),

              InkWell(
                onTap: (){
                  print("加入购物车");
                },
                child: Container(
                  color: Colors.green,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - ScreenUtil().setWidth(110)) * 0.5,
                  height:ScreenUtil().setHeight(80),
                  child: Text(
                    "加入购物车",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          InkWell(

            onTap: (){
              print("立即结算");
            },
            child: Container(
              color: kColor.primaryColor,
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - ScreenUtil().setWidth(110)) * 0.5,
              height:ScreenUtil().setHeight(80),
              child: Text(
                '立即结算',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

          ),

        ],

      ),

    );
  }




}


