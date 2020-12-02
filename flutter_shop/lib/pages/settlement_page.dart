import 'package:flutter/material.dart';
import 'package:flutter_shop/config/const_url.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:dio/dio.dart';
import 'dart:convert'; //解析数据用的

class SettlementPage extends StatefulWidget {
  @override
  _SettlementPageState createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('确认订单'),
      ),
      body: FutureBuilder(

        future: request(kUrl.getSettleInfo, formData: null),
        builder: (context,snapshot){
          print('---getSettleInfo---getSettleInfo----${snapshot.hasData}');
          return Text('xxxx');

        },
      ),
    );
  }



  Widget _setupAddressWidget(){

    return Container(



    );

  }


  /**
   * 获取商品详情数据
   */
//  Future getGoodsInfo() async {
//
////    var formData = {'goodId': goodId};
//
//    Dio dio = Dio();
//
////    dio.options.contentType = Headers.formUrlEncodedContentType;
//
//    await dio.post("http://127.0.0.1:3000/getSettleInfo",).then((value) {
//      var responseData = json.decode(value.toString());
//
//      print("获取确认订单数据:" + responseData.toString());
//
//    });
//
//    return "";
//
//  }







}


