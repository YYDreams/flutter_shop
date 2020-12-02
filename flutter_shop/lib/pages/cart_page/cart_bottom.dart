import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';
import '../../provide/cart_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../pages/settlement_page.dart';
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
//          margin: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _setupAllCheckWidget(),
              _setupPriceWidget(context),
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
        width: ScreenUtil().setWidth(150),
        child: Row(
      children: [
        Checkbox(
            value: Provide.value<CartProvide>(context).isAllCheck,
            activeColor: kColor.primaryColor,
            onChanged: (bool isAllCheck) {

              Provide.value<CartProvide>(context).changeAllCheckStatus(isAllCheck);

            }),
        Text('全选', style: TextStyle(fontSize: 15, color: Colors.black)),
      ],
    ));
  }

  /*
   * 合计
   */
  _setupPriceWidget(BuildContext context) {
    return Container(
//      color: Colors.orange,
      width: MediaQuery.of(context).size.width - ScreenUtil().setWidth(350),
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          //toStringAsFixed 保留几位小数
          Text(
              '合计:￥${Provide.value<CartProvide>(context).allPrice.toStringAsFixed(2)}'),
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
      width: ScreenUtil().setWidth(180),
      color: kColor.primaryColor,
      child: FlatButton(
        onPressed: (){
          //TODO 待处理  Navigator.push(context,
          //      MaterialPageRoute(builder: (context) => GoodsDetailPage(goodsId)));
          print('进入结算页面');
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SettlementPage()));


        },
        color: kColor.primaryColor,
        child: Text(
          '结算(${Provide.value<CartProvide>(context).allGoodsCount})',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
