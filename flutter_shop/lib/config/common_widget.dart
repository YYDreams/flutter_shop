import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';


class kCommon{
  /*
  * 设置分割线
  */
  Widget setupLineWidget({double width = 10, Color color = kColor.defalutBgColor}){

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: width,
            color: color,
          ),
        ),
      ),
    );

  }





}



