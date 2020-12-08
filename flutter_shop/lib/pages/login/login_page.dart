import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../config/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/common_widget.dart';
import '../../config/color.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSelected = false; //是否选中阅读并同意

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '登录',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0, //去掉AppBar底部阴影
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _setupWelcomeWidget(),
          _setupPhoneWidget(),
          kCommon().setupLineWidget(width: 1),
          _setupCodeWidget(),
          kCommon().setupLineWidget(width: 1),
          _setupReadWidget(),
          _setupLoginWidget(),
          _setupWeChatWidget(),
          _setupbuyVipWidget(),
        ],
      ),
    );
  }

  /// 手机号
  Widget _setupWelcomeWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24, top: 30),
      child: Text('欢迎山姆会员',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          )),
    );
  }

  /// 手机号
  Widget _setupPhoneWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 40),
      height: ScreenUtil().setHeight(120),
      child: Row(
        children: [
          Text(
            '+86',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(width: 12),
          Text('|', style: TextStyle(fontSize: 16, color: Colors.grey)),
          Expanded(
            child: TextField(

                maxLength: 11,
                decoration: InputDecoration(
                  counterText: "",//此处控制最大字符是否显示 （0/11）
                  border: InputBorder.none,
                  //去掉TextField下划线
                  hintText: '请输入手机号',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xffACB1B6),
                  ),
                  labelText: '手机号',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  //filled: true,  //设置背景色填充模式为-充满
                  contentPadding: const EdgeInsets.all(10.0),
                ),
                // 当 value 改变的时候，触发
                onChanged: (val) {
                  print(val);
                }),
          ),
        ],
      ),
    );
  }

  /// 验证码
  Widget _setupCodeWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 12),
      height: ScreenUtil().setHeight(120),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //去掉TextField下划线
                  hintText: '请输入短信验证码',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xffACB1B6),
                  ),
                  labelText: '验证码',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  //filled: true,
                  contentPadding: const EdgeInsets.all(10.0),
                ),
                // 当 value 改变的时候，触发
                onChanged: (val) {
                  print(val);
                }),
          ),
          FlatButton(
              onPressed: () {
                print('获取验证码');
              },
              child: Text('获取验证码')),
        ],
      ),
    );
  }

  /// 阅读xx条款
  Widget _setupReadWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 20, 12, 50),
        child: Row(
      children: [
        Checkbox(
            value: this.isSelected,
            activeColor: Color(0xff0165B8),
            onChanged: (bool value) {
              setState(() {
                this.isSelected = !this.isSelected;
              });
            }),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: '我已阅读并同意',
              style: TextStyle(fontSize: 14, color: Color(0xff4F5356)),
              children: [
                TextSpan(
                    text: '《山姆会员商店会员章程》',
                    style: TextStyle(fontSize: 14, color: Color(0xff0165B8)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //TODO 会员章程链接跳转
                        print('山姆会员商店会员章程');
                      }),
                TextSpan(
                  text: '及',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                TextSpan(
                  text: '《 隐私政策》',
                  style: TextStyle(fontSize: 14, color: Color(0xff0165B8)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      //TODO 隐私政策链接跳转
                      print('点击了隐私政策');
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  /// 登录
  Widget _setupLoginWidget() {
    return Container(
      color: Color(0xff0165B8),
      margin: EdgeInsets.fromLTRB(12, 0, 12, 53),
      width: ScreenUtil.screenWidthDp - 24,
      height: 48,
      child: FlatButton(
        onPressed: () {
          print('登录');
        },
        child: Text(
          '登录',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  /// 微信登录
  Widget _setupWeChatWidget() {
    return Container(
        alignment: Alignment(0.0, 0.0), //中心点 （左上角是 （-1，-1） 右下角是 （1,1））
        child: FlatButton(
          onPressed: () {
            print('登录');
          },
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_wechat.png",
//            width: 30,
//            height: 30,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '微信登录',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff898E92),
                ),
              )
            ],
          ),
        ));
  }

  /// 还不是山姆会员？成为会员，购买会籍

  Widget _setupbuyVipWidget() {
    return Container(

      margin: EdgeInsets.only(top: 60),
      alignment: Alignment(0.0,0.0),
      child: Expanded(

        child: RichText(
            text:TextSpan(
                text: '还不是山姆会员？成为会员，',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff4F5356),
                ),
                children: [
                  TextSpan(
                      text: '购买会籍>',
                      style: TextStyle(
                        fontSize: 14,
                        color:  Color(0xff0165B8),
                      ),
                      //TODO 购买会籍
                      recognizer: TapGestureRecognizer()..onTap = (){
                        print('购买会籍');

                      }
                  )
                ]

            )

        ),


      ),
    );
  }
}
