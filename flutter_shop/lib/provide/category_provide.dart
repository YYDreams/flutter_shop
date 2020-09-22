
import 'package:flutter/material.dart';

import '../model/category_model.dart';



class CategoryProvide with ChangeNotifier{
  int currentIndex = 0;
  List <SecondCategoryVO> subCategoryGoodsList =  [];  //二级分类列表

  int categoryIndex = 0; //一级分类的索引

  int  subCategoryIndex = 0;//二级分类的索引

  String categoryId = '4'; //一级分类的id

  String  subCategoryId = '';//二级分类的id

  int page = 1;  //列表页数，当改变一级分类或者二级分类时改变

  String  noMoreText = ''; //显示更多

  bool isNewCategory = true;



//  首页点击类别时更改
  changeCategory(String id,int index){

    categoryId = id;
    categoryIndex  = index;
    subCategoryId = '';
    notifyListeners(); //通知

  }

// 改变二级分类索引
  changeSubCategory(String id, int index){

    isNewCategory = true;
    subCategoryId  = id;
    subCategoryIndex = index;
    page = 1;
    noMoreText = '';
    notifyListeners(); //通知

  }

// 获取二级分类数据
  getSubCategory(List<SecondCategoryVO> list, String id){


    isNewCategory = true;
    categoryId  = id;
    subCategoryIndex = 0;
    page = 1;
    subCategoryId = ''; //点击一级分类时 把二级分类的id清空
    noMoreText = '';

    SecondCategoryVO all = SecondCategoryVO();

    all.secondCategoryId = '';
    all.firstCategoryId = '00';

    all.secondCategoryName = '全部';

    all.comments = 'null';

    subCategoryGoodsList = [all];

    subCategoryGoodsList.addAll(list);

    notifyListeners();
  }


//  改变noMore
  changeNoMore(String text){

    noMoreText  = text;

    notifyListeners();
  }

  changeFalse(){

    isNewCategory = false;

  }



  addPage() {
    page++;

  }
}

