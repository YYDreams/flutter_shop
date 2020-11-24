import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cart_provide.dart';
import '../../model/cart_model.dart';
class CartCount extends StatelessWidget {

  final CartModel model;

  CartCount(this.model);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: ScreenUtil().setWidth(170),
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: kColor.defalutBorderColor),
      ),
      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _setupReduceButtonWidget(context),
          _setupCountTextWidget(),
          _setupAddButtonWidget(context),

        ],
      ),

    );
  }

/*
 *  设置减号按钮
 */
  Widget _setupReduceButtonWidget(BuildContext context){

    return Container(
      width: ScreenUtil().setWidth(50),
      height: ScreenUtil().setWidth(50),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1,color: kColor.defalutBorderColor),
          )
      ),
      child: FlatButton(onPressed: (){
        print('减号');

        Provide.value<CartProvide>(context).changeGoodsCount(model, GoodsCountType.reduce);

      }, child: Text('-')),

    );
  }

  /*
   *  设置商品数量
   */

  Widget _setupCountTextWidget(){

    print('count=====${model.count}');
    return Container(
      width: ScreenUtil().setWidth(50),
      child: Text('${model.count}',textAlign: TextAlign.center),
    );
  }

  /*
   *  设置加号按钮
   */
  Widget _setupAddButtonWidget(BuildContext context){

    return Container(
      width: ScreenUtil().setWidth(50),
      height: ScreenUtil().setWidth(50),
      decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 1,color: kColor.defalutBorderColor),
          )
      ),
      child: FlatButton(onPressed: (){
        print('+号');
        Provide.value<CartProvide>(context).changeGoodsCount(model, GoodsCountType.add);


      }, child: Text('+')),
    );
  }

}
