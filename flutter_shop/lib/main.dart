import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/provide/current_index_provide.dart';
import 'package:provide/provide.dart';
import './config/index.dart';
import './provide/category_provide.dart';



void main() {

//初始化
var  currentIndexProvide = CurrentIndexProvide();

var categoryIndexProvide  =  CategoryProvide();

var providers = Providers(); //状态管理
  // 当有多个的时候再一个一个加进入即可 当有多个的时候用..
  providers
     ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
     ..provide(Provider<CategoryProvide>.value(categoryIndexProvide));

  
  runApp(ProviderNode(child: MyApp(),providers: providers,));

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(

      child: MaterialApp(
      title: kString.homeTitle,
      debugShowCheckedModeBanner: false,
      //主题
      theme: ThemeData(
        primaryColor: kColor.primaryColor,
        
      ),
      home: IndexPage(),
    ),
    );
  }
}