import 'package:flutter/material.dart';

class ShopCardPage extends StatefulWidget {
  ShopCardPage({Key key}) : super(key: key);

  @override
  _ShopCardPageState createState() => _ShopCardPageState();
}

class _ShopCardPageState extends State<ShopCardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text("购物车"),
       ),
    );
  }
}