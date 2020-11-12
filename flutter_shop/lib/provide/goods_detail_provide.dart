
import 'package:flutter/material.dart';
import '../model/details_model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class GoodsDetailProvide with ChangeNotifier{


   GoodDetailModel goodsInfo = null;

   //TabBar切换 默认左侧选中
   bool isLeft = true;

   bool isRight = false;



   getGoodsInfo(String goodId) async {

     var formData = {'goodId': goodId};

     Dio dio = Dio();

     dio.options.contentType = Headers.formUrlEncodedContentType;

     await dio.post("http://127.0.0.1:3000/getGoodDetail",data:formData).then((value) {
       var responseData = json.decode(value.toString());

       goodsInfo = GoodDetailModel.fromJson(responseData);

       print("获取商品信息数据:" + responseData.toString());
       notifyListeners();

     });
   }


   //改变选中状态
   changeSelectedWithStatus(bool isLeftSelect){

     if(isLeftSelect){

       isLeft = true;
       isRight = false;
     }else{
       isLeft = false;
       isRight = true;
     }

     notifyListeners();

   }



}
