import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:provide/provide.dart';
import 'cart_page/cart_bottom.dart';
import 'cart_page/cart_item.dart';
import '../provide/cart_provide.dart';

class ShopCardPage extends StatefulWidget {
  ShopCardPage({Key key}) : super(key: key);

  @override
  _ShopCardPageState createState() => _ShopCardPageState();
}

class _ShopCardPageState extends State<ShopCardPage> {
  @override
  Widget build(BuildContext context) {
    //获取购物车数据
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
          future: _getCartListData(context),
          builder: (context, snapshot) {
            List cartList = Provide.value<CartProvide>(context).cartList;
            print('----获取购物车是否成功--${snapshot.hasData} ${snapshot.data}');
            if (snapshot.hasData && cartList != null) {

              return Stack(
                children: [
                  //监听 一旦有加入购物车的情况就会调换
                  Provide<CartProvide>(builder: (context, child, cadrProcide) {
                    List cartList =
                        Provide.value<CartProvide>(context).cartList;
                    print('----购物车数据发生改变--${cartList.toString()}');
                     //购物车列表
                    return ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartItem(cartList[index]);
                        });
                  }),
                  //底部组件
                  Positioned(left: 0, bottom: 0, child: CartBottomPage())
                ],
              );
            } else {
              return Text(kString.loading); //加载中
            }
          }),
    );
  }

 /*
  * 获取购物车数据
  */
  Future _getCartListData(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();

    return 'end';
  }
}
