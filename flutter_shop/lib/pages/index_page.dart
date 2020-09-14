
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/pages/category_page.dart';
import 'package:flutter_shop/pages/home_page.dart';
import 'package:flutter_shop/pages/mine_page.dart';
import 'package:flutter_shop/pages/shop_card_page.dart';
import 'package:flutter_shop/provide/current_index_provide.dart';
import '../provide/current_index_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatelessWidget{

//定义底部(title/icon) list
final List<BottomNavigationBarItem> bottomTabs = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    title: Text(kString.homeTitle),//首页
  ),
    BottomNavigationBarItem(
    icon: Icon(Icons.category),
    title: Text(kString.categoryTitle),//分类
  ),
    BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    title: Text(kString.shopCardTitle),//购物车
  ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    title: Text(kString.mineTitle),// 我的
  ),
];

//控制器list
final List <Widget> tabBodies = [
  HomePage(),
  CategoryPage(),
  ShopCardPage(),
  MinePage(),
];

@override
 Widget build(BuildContext context) {
   
   //适当的尺寸 根据它进行变化  ScreenUtil内部会进行适配
   ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

  return Provide<CurrentIndexProvide>(
    
    builder: (context,child,value){
      
      //获取当前索引状态值
      // 在别的模块也能通过他获取
      int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;

      print(currentIndex);
       
      return Scaffold(
        
        bottomNavigationBar: BottomNavigationBar(
        items: bottomTabs,
        type: BottomNavigationBarType.fixed, //默认fixed模式下使用主题色
        currentIndex: currentIndex,
        onTap: (index){ //切换tabBar
          Provide.value<CurrentIndexProvide>(context).changeIndex(index);  
        }),

       // 为了可以保存状态 需要嵌套一个 IndexedStack （堆栈需要 传入tab列表和下标）
        body: IndexedStack(
          index: currentIndex,
         // 列表需要的对象是 list<Widget> 需要及时更正对象类型是否正确
          children: tabBodies,
        ),
      );


      //


    },


  );


 }

}