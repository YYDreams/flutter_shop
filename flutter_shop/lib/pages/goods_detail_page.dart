import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'dart:async';
import 'package:provide/provide.dart';
import '../provide/goods_detail_provide.dart';
import '../pages/details_page/details_top_area.dart';
import '../pages/details_page/details_top_explain.dart';
import '../pages/details_page/details_tabbar.dart';
import '../pages/details_page/details_web.dart';
import '../pages/details_page/details_bottom.dart';

class GoodsDetailPage extends StatelessWidget {
  final String goodsId;

  GoodsDetailPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(kString.kGoodsDetailTitle), //商品详情
      ),

      body: FutureBuilder(
        //获取商品信息
        future: _getGoodsInfo(context),
        builder: (context, snapshot) {
          print('----获取商品信息是否成功--${snapshot.hasData}');
          if (snapshot.hasData) {
            return Stack(
              children: [
                ListView(
                  children: [
                    DetailArea(),
                    DetailExplain(),
                    DetailsTabBarPage(),
                    DetailsWebPage(),
                  ],
                ),
                //底层元素
                Positioned(bottom: 0, left: 0, child: DetailBottonPage()),
              ],
            );
          } else {
            return Text(kString.kloadingText);//"加载中...."
          }
        },
      ),
    );
  }
  /**
   * 获取商品详情数据
   */
  Future _getGoodsInfo(BuildContext context)  async {
    //加载商品详情数据
   await Provide.value<GoodsDetailProvide>(context).getGoodsInfo(goodsId);

//   此处很重要  之前  一定要return 否则snapshot.hasData一直打印的都是false
   return "";

  }
}
