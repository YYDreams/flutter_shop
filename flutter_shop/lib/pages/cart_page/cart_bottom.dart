import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';
import '../../provide/cart_provide.dart';
import 'package:provide/provide.dart';

class CartBottomPage extends StatefulWidget {
  @override
  _CartBottomPageState createState() => _CartBottomPageState();
}
class _CartBottomPageState extends State<CartBottomPage> {
  @override
  Widget build(BuildContext context) {
    return Provide<CartProvide>(builder: (context, child, value) {
      return Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _setupAllCheckWidget(),
              _setupPriceWidget(),
              _setupSettlementWidget(),
            ],
          ));
    });
  }

  /*
   * 全选按钮
   */
  _setupAllCheckWidget() {
    return Container(
      child: FlatButton(
        onPressed: () {},
        color: Colors.red,
        child: Text('全选'),
      ),
    );
  }

  /*
   * 合计
   */
  _setupPriceWidget() {
    return Container(
      child: Column(
        children: [
          Text('合计:￥100'),
          Text('满10元免配送费'),
        ],
      ),
    );
  }

  /*
   * 结算
   */
  _setupSettlementWidget() {
    return Container(
      child: Positioned(
        right: 10,
        child: FlatButton(
          color: kColor.primaryColor,
          child:
              Text('结算(${Provide.value<CartProvide>(context).allGoodsCount})'),
        ),
      ),
    );
  }
}
