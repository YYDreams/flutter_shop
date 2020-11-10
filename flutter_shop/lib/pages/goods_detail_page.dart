
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/const_url.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:async';

class GoodsDetailPage extends StatelessWidget {

  final String goodsId;

  GoodsDetailPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    
    //SafeArea适配刘海屏
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
              Navigator.pop(context);
//              Navigator
            }),
          title: Text("商品详情"),
          ),

          //
          body: FutureBuilder(


            //获取商品信息
            future: _getGoodsInfo(context),
            builder: (context,snapshot){

              if(snapshot.hasData){

                return Stack(

                  children: [

                    ListView(
                      
                      children: [

                      ],
                    ),
                    //底层元素
                    Positioned(
                      bottom: 0,
                        left: 0,
                        child: Text("底部组件"))
                  ],
                );
              }else{
                return Text("加载中....");

              }

            },


          ),
          
        )
    );
  }


  Future _getGoodsInfo(BuildContext context) async{

    var formData = {'goodId':'001'};


    Dio dio = Dio();

    dio.options.contentType = Headers.formUrlEncodedContentType;


    await dio.post("http://127.0.0.1:3000/getGoodDetail").then((value){


      var responseData  = json.decode(value.toString());

      print("responseData:" + responseData.toString());

    });


  }



}
