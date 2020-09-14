
import 'package:flutter/material.dart';
import '../config/index.dart';
import '../service/http_service.dart';

import 'dart:convert'; //解析数据用的

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // super.build(context);

  return Scaffold(
    backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
    appBar: AppBar(
      title: Text(kString.homeTitle),
    ),
      //请求数据
      body:FutureBuilder(
        future: request('getHomePageContent',formData:null), 
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data  = json.decode(snapshot.data.toString());
            print(data);
            List <Map> swipeDataList = (data['data']['slides'] as List).cast() ; //轮播图
            List <Map> category = (data['data']['category'] as List).cast() ; //分类
            List <Map> recommend = (data['data']['recommend'] as List).cast() ; //推荐     
            List <Map> floor1 = (data['data']['floor1'] as List).cast() ;  //商品推荐底部 
            Map  floor1Pic = data['data']['floor1Pic'];  //广告
            
            return Container(
              child: Text(""),
            );
          }else{
            return Container(
              child: Text("加载中..."),
            );
          }
        },
      ),

  );
  }
}