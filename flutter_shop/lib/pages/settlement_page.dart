
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/const_url.dart';
import 'package:flutter_shop/model/settlement_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:dio/dio.dart';
import 'package:provide/provide.dart';
import 'dart:convert'; //解析数据用的
import '../provide/settlement_provide.dart';
import '../config/string.dart';

class SettlementPage extends StatefulWidget {
  @override
  _SettlementPageState createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {

  SettlementModel settlementModel = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
//    //获取结算页数据
//    getSettleInfo();
//

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('确认订单'),
      ),

      body: FutureBuilder(
        //获取商品信息
        future: _getSettleInfo(context),
        builder: (context, snapshot) {
          print('----获取结算信息是否成功--${snapshot.hasData},${snapshot.data}');
          if (snapshot.hasData) {
            return Stack(
              children: [
//                settlementModel
         _setupAddressWidget(),
//                ListView(
//                  children: [
//                    DetailArea(),
//                    DetailExplain(),
//                    DetailsTabBarPage(),
//                    DetailsWebPage(),
//                  ],
//                ),
                //底层元素
                Positioned(bottom: 0, left: 0, child: Text('xxxx')),
              ],
            );
          } else {
            return Text(kString.kloadingText);//"加载中...."
          }
        },
      ),
    );
  }



  Widget _setupAddressWidget(){

   SettlementModel settlementModel =  Provide.value<SettlementProvide>(context).settlementModel;

    return Container(

        child: Text(settlementModel.data.bannerInfo.deliveryDelayTips) ,




    );

  }




  /*
  * 获取购物车数据
  */
  Future _getSettleInfo(BuildContext context) async {

     await Provide.value<SettlementProvide>(context).getSettleInfo();

     return 'xxxx';

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


