import 'package:flutter/material.dart';

class CartBottomPage extends StatefulWidget {
  @override
  _CartBottomPageState createState() => _CartBottomPageState();
}

class _CartBottomPageState extends State<CartBottomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Text('结算'),

    );
  }
}
