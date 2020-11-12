import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';
import '../../provide/goods_detail_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//商品详情的首页区域 （图片、商品名称、价格、编号的 UI展示）
class DetailArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvide>(
      builder: (context, child, value) {

        var goodsInfo =
            Provide.value<GoodsDetailProvide>(context).goodsInfo.data.goodInfo;

        if (goodsInfo != null) {
          return Container(
            color: Colors.white,

            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                _setupGoodsImage(context, goodsInfo.image1),
                _setupGoodsTitle(goodsInfo.goodsName),
                _setupGoodsNum(goodsInfo.goodsSerialNumber),
                _setupGoodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice),
              ],
            ),
          );
        } else {
          return Text("加载中");
        }
      },
    );
  }

  /**
   * 商品图片
   */
  Widget _setupGoodsImage(BuildContext context, url) {
    return Container(
      child: Image.network(
        url,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  /**
   * 商品名称
   */
  Widget _setupGoodsTitle(title) {
    return Container(
      padding: EdgeInsets.only(left: 12),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  /**
   * 商品编号
   */
  Widget _setupGoodsNum(numberStr) {
    return Container(
      padding: EdgeInsets.only(left: 12),
    margin: EdgeInsets.only(top: 8,bottom: 8),
      child: Text(
        '编号：$numberStr',
        style: TextStyle(fontSize: 15, color: Colors.black26),
      ),
    );
  }

  /**
   * 商品价格
   */
  Widget _setupGoodsPrice(double price, double originPrice) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          "￥$price",
          style: TextStyle(fontSize: 20, color: kColor.primaryColor),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '市场价$originPrice',
          style: TextStyle(
              fontSize: 15,
              color: Colors.black12,
              //添加划线
              decoration: TextDecoration.lineThrough),
        ),
      ],
    );
  }
}
