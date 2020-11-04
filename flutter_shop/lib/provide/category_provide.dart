import '../model/categoryModel.dart';
import 'package:flutter/material.dart';

class CategoryProvide with ChangeNotifier {
  List<SecondCategoryVO> secondatgoryGoodsList = []; //二级分类列表

  int secondCategoryIndex = 0; //二级分类索引

  int firstCategoryIndex = 0; //一级分类索引

  String secondCategoryId = '4'; //二级分类id

  String firstCategoryId = ''; //一级分类id

  int page = 1; //列表页面 当改变一级分类或者二级分类时进行改变

  String noMoreText = ''; //显示更多的表示

  bool isNewCategory = true;

  //首页点击类别时 更改类别
  changeFirstCategory(String id, int index) {


    firstCategoryIndex = index;

    firstCategoryId = id;

    secondCategoryId = '';

    notifyListeners();
  }

  //改变二级页面索引
  changeSecondCategory(String id, int index) {
    isNewCategory = true;

    secondCategoryIndex = index;

    secondCategoryId = id;

    page = 1;

    noMoreText = '';

    notifyListeners();
  }

  getSecondCategoryData(List<SecondCategoryVO> list, String id) {

    isNewCategory = true;

    firstCategoryIndex = 0;

    firstCategoryId = id;

    page = 1;

    secondCategoryId = ''; //点击一级分类时，把二级清空

    noMoreText = '';

    //额外添加全部分类
    SecondCategoryVO all = SecondCategoryVO();

    all.secondCategoryId = '';
    all.firstCategoryId = '00';
    all.secondCategoryName = '全部';
    all.comments = 'null';

    secondatgoryGoodsList = [all];

    secondatgoryGoodsList.add(all);

    secondatgoryGoodsList.addAll(list);

    notifyListeners();
  }

  addPage() {
    page++;
  }

  changeNoMore(String text) {
    noMoreText = text;

    notifyListeners();
  }

  changeFale() {
    isNewCategory = false;
  }
}
