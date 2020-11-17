import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:provide/provide.dart';
import '../../provide/cart_provide.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        bottom: BorderSide(width: 1,color: kColor.defalutBorderColor),

      )
    ),
      child: Row(

        children: [
          _cartCheckBox(context, model),
          _getGoodsImage(model),
          _getGoodsName(model),
          _getDeleteButton(),

        ],
      ),

    );
  }


  /**
   *  选择按钮
   */

  //如果需要context，说明需要用到Provide
  Widget _cartCheckBox(BuildContext context,CartModel model){

    return Container(

      child: Checkbox(

        value: model.isCheck,
        activeColor: kColor.primaryColor,
        onChanged: (isCheck){

          model.isCheck = isCheck;

          Provide.value<CartProvide>(context).changeCheckState(model);
        },

      ),
    );

  }
}

/**
 * 商品图片
 */

Widget _getGoodsImage(CartModel model){


  return Container(

    width: ScreenUtil().setWidth(150),
    decoration: BoxDecoration(
      border: Border.all(width: 1,color: kColor.defalutBorderColor),
    ),
    child: Image.network(model.image),

  );

}

/**
 * 商品名字
 */

Widget _getGoodsName(CartModel model){


  return Container(

    width: ScreenUtil().setWidth(300),
    padding: EdgeInsets.all(10.0),
//    alignment: Alignment.topLeft,
    child: Column(

      children: [
        Text(model.name,
          style: TextStyle(
              color: Colors.black
          ),),

        //count组件
      ],
    ),

  );

}

/**
 * 删除按钮
 */
Widget _getDeleteButton(){


  return Container(
      width: ScreenUtil().setWidth(30),
    child: IconButton(icon: Icon(Icons.delete,color: Colors.black26,), onPressed: (){
      print("object");

    })
  );

}




