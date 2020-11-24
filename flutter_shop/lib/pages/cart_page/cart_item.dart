import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:provide/provide.dart';
import '../../provide/cart_provide.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/cart_page/cart_count.dart';

class CartItem extends StatelessWidget {
  final CartModel model;

  CartItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 2, 12, 2),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: kColor.defalutBorderColor),
      )),
      child: Row(
        children: [
          _setupCartCheckBoxWidget(context, model),
          _setupGoodsImageWidget(model),
          _setupGoodsInfoWidget(context, model),
          _setupDeleteButtonWidget(context, model),
        ],
      ),
    );
  }

  /*
   *  选择按钮
   */
Widget _setupCartCheckBoxWidget(BuildContext context, CartModel model) {
    return Container(
      child: Checkbox(
        value: model.isCheck,
        activeColor: kColor.primaryColor,
        onChanged: (isCheck) {
          model.isCheck = isCheck;

          Provide.value<CartProvide>(context).changeCheckState(model);
        },
      ),
    );
  }
}

/*
 * 商品图片
 */

Widget _setupGoodsImageWidget(CartModel model) {
  return Container(
    width: ScreenUtil().setWidth(150),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: kColor.defalutBorderColor),
    ),
    child: Image.network(model.image),
  );
}

/*
 * 商品名字
 */

Widget _setupGoodsInfoWidget(BuildContext context, CartModel model) {
  return Container(
    width: MediaQuery.of(context).size.width - ScreenUtil().setWidth(350),
    padding: EdgeInsets.all(10.0),
    alignment: Alignment.topLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          model.name,
          style: TextStyle(color: Colors.black),
        ),
        _setupGoodsPriceCountWidget(context, model),
      ],
    ),
  );
}

/*
 * 商品价格和数量
 */
Widget _setupGoodsPriceCountWidget(BuildContext context, CartModel model) {
  return Container(
    width: MediaQuery.of(context).size.width - ScreenUtil().setWidth(30),
    padding: EdgeInsets.only(top: 5),
    alignment: Alignment.topLeft,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '￥${model.price}',
          style: TextStyle(color: kColor.primaryColor),
        ),
        CartCount(model),
      ],
    ),
  );
}

/*
 * 删除按钮
 */
Widget _setupDeleteButtonWidget(BuildContext context, CartModel model) {
  return Container(
    child: InkWell(
        onTap: () {
          Provide.value<CartProvide>(context).deleteGoods(model.goodsId);
        },
        child: Icon(
          Icons.delete,
          color: Colors.black26,
        )),
  );
}
