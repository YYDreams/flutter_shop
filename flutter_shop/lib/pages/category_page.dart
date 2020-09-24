import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:provide/provide.dart';
import '../config/index.dart';

import '../model/category_model.dart';

import 'package:flutter_shop/provide/category_provide.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_shop/provide/category_goods_list_provide.dart';


import '../model/category_goods_list_model.dart';




class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(

       title: Text(kString.categoryTitle),
     ),
     body: Container(

       child: Row(


         children: <Widget>[

           CategoryLeftView(),
           Column(
             children: <Widget>[
               CategoryRightView(),
               CategoryGoodsListView(),

             ],

           )

         ],

       ),

     )
   );
  }
}


// 左侧视图
class CategoryLeftView extends StatefulWidget {
  @override
  _CategoryLeftViewState createState() => _CategoryLeftViewState();
}

class _CategoryLeftViewState extends State<CategoryLeftView> {

   // 分类左侧一级类目数组
  List categoryLeftList = [];
   var  selectedIndex = 0; //默认选中第一个



  // 拉取分类左测数据
  @override
  void initState() {
    super.initState();
    // 一初始化就掉分类左侧数据
    _getCategoryData();
  }


  @override
  Widget build(BuildContext context) {
    return Provide<CategoryProvide>(

      builder: (context,child,value){


//        print('点击了${categoryLeftList[value.categoryIndex].firstCategoryName}');


        selectedIndex =  value.categoryIndex;

        return Container(

          width: ScreenUtil().setWidth(180.0),

          decoration: BoxDecoration(

            border: Border(right: BorderSide(width: 1,color: kColor.defalutBorderColor)),

          ),

          child: ListView.builder(
            itemCount: categoryLeftList.length,
              itemBuilder: (context,index){

              return _leftInkWell(index);

              }),

        );

      },
      
    );
  }

//
  Widget _leftInkWell(int index){

    bool isClick = false;

    isClick = (index == selectedIndex) ? true : false;

    return InkWell(

      onTap: (){

        //获取二级分类的数据
        var subCategoryList = categoryLeftList[index].secondCategoryVO;

        var categoryId = categoryLeftList[index].firstCategoryId;

        Provide.value<CategoryProvide>(context).changeCategory(categoryId, index);


        Provide.value<CategoryProvide>(context).getSubCategory(subCategoryList, categoryId);

        //获取商品列表
        _getGoodsList(context, categoryId);



      },

      child: Container(

        height: ScreenUtil().setHeight(90),
        alignment:Alignment.center,

        decoration: BoxDecoration(
//          color:  isClick ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
          border: Border(

            bottom: BorderSide(width: 1,color: kColor.defalutBorderColor),
            left: BorderSide(width: 2,color:  isClick? kColor.primaryColor : Colors.white),

          ),
        ),
        child: Text(
            categoryLeftList[index].firstCategoryName,
          style: TextStyle(
            color:  isClick ? kColor.primaryColor : Colors.black,
            fontSize: ScreenUtil().setSp(30),

          ),
        ),

      ),

    );


  }



  // 获取分类数据
_getCategoryData() async{

  await request(kUrl.category_getCategory,formData: null).then((value){

    var data = json.decode(value.toString());
//    print('分类数据$data');

     CategoryModel model = CategoryModel.fromJson(data);

     setState(() {

       categoryLeftList = model.data;

     });


     Provide.value<CategoryProvide>(context).getSubCategory(categoryLeftList[0].secondCategoryVO, '0');



  });


}

 _getGoodsList(context,fristCategoryId){

    var data = {
//      'fristCategoryId': fristCategoryId == null ? Provide.value<CategoryProvide>(context).categoryId,
      'fristCategoryId':Provide.value<CategoryProvide>(context).categoryId,
      'secondCategoryId':Provide.value<CategoryProvide>(context).subCategoryId,
      'page':1
    };


    request(kUrl.category_getCategoryGoods, formData: data).then((value){

      var data = json.decode(value.toString());

      print("datadata+++${data}");

//      1.解析数据
      CategoryGoodsListModel goodsListModel = CategoryGoodsListModel.fromJson(data);

//      2.取出数据模型
    Provide.value<CategoryGoodsListProvide>(context).goodsList = goodsListModel.data;

//






    });


 }


}

// 右侧视图
class CategoryRightView extends StatefulWidget {
  @override

  _CategoryRightViewState createState() => _CategoryRightViewState();

}


class _CategoryRightViewState extends State<CategoryRightView> {
  @override
  Widget build(BuildContext context) {

    return Container(

      child: Provide<CategoryProvide>(

          builder:(context,child,categoryProvide){

            return Container(

              height: ScreenUtil().setHeight(80),
              width: ScreenUtil().setWidth(500),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                 bottom: BorderSide(width: 1,color: kColor.defalutBorderColor),
                )
              ),

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryProvide.subCategoryGoodsList.length,
                  itemBuilder: (context,index){

                return _rightInkWell(index, categoryProvide.subCategoryGoodsList[index]);

              }),


            );



          }

      ),



    );
  }

//  右侧顶部点击事件
  Widget _rightInkWell(int index,SecondCategoryVO  item){

    bool isClick = false;

    isClick = (index == Provide.value<CategoryProvide>(context).subCategoryIndex) ? true : false;

    return InkWell(

      onTap: (){
        Provide.value<CategoryProvide>(context).changeSubCategory(item.secondCategoryId, index);
        //获取商品列表
        _getGoodsList(index,item.secondCategoryId);


      },

      child: Container(

        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
        child: Text(
          item.secondCategoryName,

          style: TextStyle(
            color: isClick ? kColor.primaryColor : Colors.black,


          ),
        ),



      ),

    );


  }

  _getGoodsList(context, String subcategoryId){

    var data = {
      'firstCategoryId': Provide.value<CategoryProvide>(context).categoryId,
      'secondCategoryId': subcategoryId,
      'page': 1
    };



    request('getCategoryGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      print('getCategoryGoods secondCategory:::' + data.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.data == null) {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);
      }
    });

  }

}



// 商品列表
class CategoryGoodsListView extends StatefulWidget {
  @override
  _CategoryGoodsListViewState createState() => _CategoryGoodsListViewState();
}

class _CategoryGoodsListViewState extends State<CategoryGoodsListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }




}




  


