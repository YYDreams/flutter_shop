import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
class DetailsTabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Provide<GoodsDetailProvide>(

      builder: (context,child, val){

        var isLeft = Provide.value<GoodsDetailProvide>(context).isLeft;

        var isRight = Provide.value<GoodsDetailProvide>(context).isRight;


        return Container(

          margin: EdgeInsets.only(top: 10),
          child:  Column(
            children: [
              Row(

                children: [

                  _getTabBarLeft(context, isLeft),
                  _getTabBarRight(context, isRight),

                ],
              )
            ],
          ),
        );


      },

    );
    

  }


  Widget _getTabBarLeft(BuildContext context,bool isLeft){

    return InkWell(
      onTap: (){

        Provide.value<GoodsDetailProvide>(context).changeSelectedWithStatus(true);
      },
      child: Container(

        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: isLeft ? kColor.primaryColor : kColor.defalutBorderColor,
            ),

          ),
        ),
        child: Text("详情",style: TextStyle(fontSize: 15,color: isLeft ? kColor.primaryColor : Colors.black),),

      ),
    );

  }

  Widget _getTabBarRight(BuildContext context,bool isRight){


    return InkWell(
      onTap: (){

        Provide.value<GoodsDetailProvide>(context).changeSelectedWithStatus(false);
      },
      child: Container(

        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: isRight ? kColor.primaryColor : kColor.defalutBorderColor,
            ),

          ),
        ),
        child: Text("评价",style: TextStyle(fontSize: 15,color: isRight ? kColor.primaryColor : Colors.black),),

      ),
    );

  }


  Widget _setupTabBar(BuildContext context, bool isSelected,String title){

    return InkWell(
      onTap: (){

        Provide.value<GoodsDetailProvide>(context).changeSelectedWithStatus(isSelected);
      },
      child: Container(

        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: isSelected ? kColor.primaryColor : kColor.defalutBorderColor,
            ),

          ),
        ),
        child: Text(title,style: TextStyle(fontSize: 15,color: isSelected ? kColor.primaryColor : Colors.black),),

      ),
    );


  }

}
