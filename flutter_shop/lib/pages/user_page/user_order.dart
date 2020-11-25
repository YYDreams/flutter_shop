import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/color.dart';


class UserOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          _setupOrderHeaderWidget(),
          _setupOrderItemWidget(),
        ],
      ),
    );
  }



  /*
   *
   */
  Widget _setupOrderHeaderWidget(){
    return InkWell(
      child: Container(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

          ],
        ),

      ),
    );
  }


  Widget _setupOrderItemWidget(){

    return Container(

    );
  }
}
