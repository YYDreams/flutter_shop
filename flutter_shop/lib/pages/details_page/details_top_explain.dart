import 'package:flutter/material.dart';

class DetailExplain extends StatelessWidget {
@override
Widget build(BuildContext context) {
     return Container(
       color: Colors.white,
       alignment:Alignment.centerLeft,
         height: 40,
         margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 12),
         child: Text("说明：>急速送达>正品保证",

           style: TextStyle(
           color: Colors.red,
             fontSize: 16

           ),),


);
}
}
