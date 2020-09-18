import 'package:flutter/material.dart';
import '../config/index.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),

      appBar: AppBar(
        title: Text(kString.mineTitle),
      ),
      body: ListView(

        children: <Widget>[

            UserHeaderView(
              userInfo: {"images":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600329087664&di=7f2cd0b92984b4c75c39d0b948b87b9c&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201609%2F16%2F20160916125505_VJyKt.thumb.700_0.jpeg","userName":"哈哈哈哈哈"},
    

            ),

        ],
        
      ),
    );
  }
}

// 头像已经昵称
class UserHeaderView extends StatelessWidget{

 final Map userInfo;

 UserHeaderView({Key key, this.userInfo}) : super(key: key);


 @override
  Widget build(BuildContext context) {
    return InkWell(
      
      child: Container(
       height:ScreenUtil().setHeight(100),
       
        child: Row(

crossAxisAlignment:CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
             Padding(padding: EdgeInsets.only(top: 20.0)),

             Image.network(userInfo["images"],
             
             ),
             Padding(padding: EdgeInsets.only(left: 20.0)),
            Text(userInfo["userName"],style: TextStyle(
              color: Colors.black,
            ),),

          ],

        
        ),

      
      ),


    );
  }






}




