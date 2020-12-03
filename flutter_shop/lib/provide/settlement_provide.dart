
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../model/settlement_model.dart';

class SettlementProvide with ChangeNotifier{


SettlementModel settlementModel;

/// 获取结算页数据
  getSettleInfo() async {

    Dio dio = Dio();

    await dio.post("http://127.0.0.1:3000/getSettleInfo",).then((value) {
      var responseData = json.decode(value.toString());

      print("获取商品信息数据:" + responseData.toString());

     settlementModel  =  SettlementModel.fromJson(responseData);

           print("获取结算页数据:" + settlementModel.data.bannerInfo.deliveryDelayTips);

        notifyListeners();


    });

  }





}
