import 'package:fluro/fluro.dart';
import '../pages/goods_detail_page.dart';
import 'package:flutter/material.dart';

//商品详情跳转
Handler detailHandler = Handler(

  handlerFunc: (BuildContext context,Map<String, List<String>> params){

    String goodsId = params["id"].first;

    return GoodsDetailPage(goodsId);

  }
);