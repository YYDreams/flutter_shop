import 'package:flutter/material.dart';
import 'package:flutter_shop/config/const_url.dart';
import 'package:flutter_shop/model/settlement_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:dio/dio.dart';
import 'package:provide/provide.dart';
import 'dart:convert'; //解析数据用的
import '../provide/settlement_provide.dart';

class SettlementPage extends StatefulWidget {
  @override
  _SettlementPageState createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {

  SettlementModel settlementModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    //获取结算页数据
    getSettleInfo();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('确认订单'),
      ),

      body: ListView.builder(itemBuilder:(BuildContext context, int index){







      } )
    );
  }



  Widget _setupAddressWidget(){

    return Container(




    );

  }



  /// 获取结算页数据
  getSettleInfo() async {

    Dio dio = Dio();

    await dio.post("http://127.0.0.1:3000/getSettleInfo",).then((value) {
      var responseData = json.decode(value.toString());

      print("获取商品信息数据:" + responseData.toString());

      settlementModel  =  SettlementModel.fromJson(responseData);

      print("获取结算页数据:" + settlementModel.data.bannerInfo.deliveryDelayTips);



    });

  }




}


