//切换底部导航栏
// 构建混合ChangeNotifier的类，操作全局数据

import 'package:flutter/material.dart';

class CurrentIndexProvide with ChangeNotifier{
  int currentIndex = 0;
  changeIndex(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }
}
