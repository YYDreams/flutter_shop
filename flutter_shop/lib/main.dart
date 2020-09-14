import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/provide/current_index_provide.dart';
import 'package:provide/provide.dart';
import './config/index.dart';

void main() {

var  currentIndexProvide = CurrentIndexProvide();
  //状态管理
  var providers = Providers();
  // 当有多个的时候再一个一个加进入即可
  providers..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));


  runApp(ProviderNode(child: MyApp(),providers: providers,));


}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

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