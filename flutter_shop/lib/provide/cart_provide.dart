import 'package:flutter/material.dart';
import '../model/cart_model.dart';

//数据持久化
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

enum GoodsCountType {
  add,
  reduce,
}

class CartProvide with ChangeNotifier {
  String kCartInfoKey = 'cartInfo'; //存储在本地数据key的名字

  String cartString = "[]"; //保存json数据

  List<CartModel> cartList = []; //商品列表数据

  double allPrice = 0; //总价格

  int allGoodsCount = 0; //商品总数量

  bool isAllCheck = true; //是否全选

  /*
   * 保存加购数据
   */
  saveCart(goodsId, goodsName, count, price, image) async {
    //初始化
    SharedPreferences prefe = await SharedPreferences.getInstance();

    cartString = prefe.getString(kCartInfoKey);

    var temp = (cartString == null) ? [] : json.decode(cartString.toString());

    //把获取到的值转变为List
    List<Map> tempList = (temp as List).cast();

    //用于判断购物车中是否存在该商品，默认false
    var isHave = false;

    //用于进行循环的索引使用
    var index = 0;

    allPrice = 0;

    allGoodsCount = 0;

    //遍历
    tempList.forEach((element) {
      if (element['goodsId'] == goodsId) {
        tempList[index]['count'] = element['count'] + 1;

        cartList[index].count++;

        isHave = true;
      }

      if (element['isCheck']) {
        allPrice += (cartList[index].price * cartList[index].count);

        allGoodsCount += cartList[index].count;
      }

      index++;
    });

    if (!isHave) {
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'name': goodsName,
        'count': count,
        'price': price,
        'image': image,
        'isCheck': true
      };
      tempList.add(newGoods);
      cartList.add(CartModel.fromJson(newGoods));
      allPrice += (count * price);
      allGoodsCount += count;
    }

    cartString = json.encode(tempList).toString();

    //存储到本地
    prefe.setString(kCartInfoKey, cartString);

    notifyListeners();
  }

  /*
   * 获取购物车数据
   */
  getCartInfo() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();

    //获取持久化存储的值
    cartString = prefer.getString(kCartInfoKey);

    //
    cartList = [];

    if (cartString == null) {
      cartList = [];
    } else {
      //把查询出来的json转化成列表
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

      allPrice = 0;
      allGoodsCount = 0;
      isAllCheck = true;
      tempList.forEach((element) {
        if (element['isCheck']) {
          allPrice += element['count'] * element['price'];
          allGoodsCount += element['count'];
        } else {
          isAllCheck = false;
        }

        cartList.add(CartModel.fromJson(element));
      });
    }

    notifyListeners();
  }

  /*
   * 修改选中状态 (主要目的:改变model.isCheck属性，刷新数据)
   */
  changeCheckState(CartModel model) async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    cartString = prefer.getString(kCartInfoKey);

    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int changeIndex = 0;

    tempList.forEach((element) {
      if (element['goodsId'] == model.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex] = model.toJson();
    cartString = json.encode(tempList).toString();
    prefer.setString(kCartInfoKey, cartString);

    await getCartInfo();
  }

  /*
   * 删除商品
   */
  deleteGoods(String goodsId) async {
    SharedPreferences prefre = await SharedPreferences.getInstance();
    cartString = prefre.getString(kCartInfoKey);

    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int deleteIndex = 0;

    tempList.forEach((element) {
      if (element['goodsId'] == goodsId) {
        deleteIndex = tempIndex;
      }
      tempIndex++;
    });

    tempList.removeAt(deleteIndex);

    cartString = json.encode(tempList).toString();

    prefre.setString(kCartInfoKey, cartString);

    await getCartInfo();
  }

  /*
   *  修改商品数量
   */
  changeGoodsCount(CartModel model, GoodsCountType type) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    cartString = pre.getString(kCartInfoKey);
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((element) {
      if (element['goodsId'] == model.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    if (type == GoodsCountType.add) {
      model.count++;
    } else {
      model.count <= 1 ? (model.count = 1) : (model.count--);
    }
    tempList[changeIndex] = model.toJson();
    cartString = json.encode(tempList).toString();
    pre.setString(kCartInfoKey, cartString);
    await getCartInfo();
  }

  /*
   * 全选
   */

  changeAllCheckStatus(bool isAllCheck) async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    cartString = prefer.getString(kCartInfoKey);
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    List<Map> newList = [];

    for (var item in tempList) {
      var newItem = item;
      newItem['isCheck'] = isAllCheck;
      newList.add(newItem);
    }

    cartString = json.encode(newList).toString();
    prefer.setString(kCartInfoKey, cartString);
    await getCartInfo();
  }
}
