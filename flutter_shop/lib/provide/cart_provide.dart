
import 'package:flutter/material.dart';
import '../model/cart_model.dart';

//数据持久化
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class CartProvide with ChangeNotifier{

 String cartString = "[]"; //保存json数据

 List<CartModel>  cartList = []; //商品列表数据

 double allPrice = 0; //总价格

 int allGoodsCount = 0; //商品总数量

 bool isAllCheck = true; //是否全选


// 保存加购数据
  saveCart(goodsId,goodsName,count,price,image) async{


    //初始化
    SharedPreferences prefe = await SharedPreferences.getInstance();

    cartString  = prefe.getString('cartInfo');

    var  temp  = (cartString == null) ? [] : json.decode(cartString.toString());

    //把获取到的值转变为List
    List<Map> tempList =  (temp as List).cast();

    //用于判断购物车中是否存在该商品，默认false
    var isHave = false;

    //用于进行循环的索引使用
    var index = 0;

    allPrice = 0;

    allGoodsCount = 0;

    //遍历
    tempList.forEach((element) {

      if(element['goodsId'] == goodsId){

        tempList[index]['count'] = element['count'] + 1;

        cartList[index].count ++;

        isHave = true;

        }

      if(element['isCheck']){
        allPrice += (cartList[index].price * cartList[index].count);

        allGoodsCount  += cartList[index].count;

      }

      index++;

    });


    if(!isHave){
      Map<String,dynamic> newGoods = {

        'goodsId':goodsId,
        'name':goodsName,
        'count':count,
        'price':price,
        'image':image,
        'isCheck':true
      };
      tempList.add(newGoods);
      cartList.add(CartModel.fromJson(newGoods));
      allPrice += (count * price);
      allGoodsCount += count;

    }

    cartString = json.encode(tempList).toString();

    //存储到本地
    prefe.setString('cartInfo', cartString);

    notifyListeners();


  }

  //获取购物车数据
  getCartInfo() async{

    SharedPreferences prefer =  await SharedPreferences.getInstance();

    //获取持久化存储的值
    cartString =  prefer.getString('cartInfo');

    //
    cartList = [];

    if(cartString == null){

      cartList = [];

    }else{
      //把查询出来的json转化成列表
      List <Map> tempList  = (json.decode(cartString.toString()) as List).cast();

      allPrice = 0;
       allGoodsCount = 0;
       isAllCheck = true;
       tempList.forEach((element) {
         if(element['isCheck']){

           allPrice += element['count'] * element['price'];
           allGoodsCount += element['count'];

         }else{
           isAllCheck = false;
         }

         cartList.add(CartModel.fromJson(element));

       });


    }

    notifyListeners();
}

}