import 'package:flutter/material.dart';
import '../config/index.dart';
import '../service/http_service.dart';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';
import '../model/categoryModel.dart';
import '../provide/category_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                RightCategoryNav(),
                CategoryGoodsList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//左侧组件
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {

  List<Data> categoryList =  [];
  var  selectedIndex = 0; //索引
  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryProvide>(

      builder: (context,child,value){

        //获取商品列表
        selectedIndex = value.firstCategoryIndex;

        return Container(
          width: ScreenUtil().setWidth(150),


        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1,color: kColor.defalutBorderColor)),

        ),
        child: ListView.builder(
            itemCount: categoryList.length,
            itemBuilder: (BuildContext context, int index){

            return   _leftItemAction(index);

            }),

        );

      },


    );
  }

Widget _leftItemAction(int index){

    bool isClick = false;

    isClick = (index == selectedIndex) ? true : false;


    return InkWell(
      onTap: (){
        print("$index-----");

        var secondCategoryList = categoryList[index].secondCategoryVO;

        var firstCategoryId = categoryList[index].firstCategoryId;


        //
        Provide.value<CategoryProvide>(context).changeFirstCategory(firstCategoryId, index);

        Provide.value<CategoryProvide>(context).getSecondCategoryData(secondCategoryList, firstCategoryId);

        //获取商品列表


      },

      child: Container(
        height: ScreenUtil().setHeight(80),
        padding: EdgeInsets.only(left: 10,top: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1,color:kColor.defalutBorderColor),
            left:  BorderSide(width: 2,color:isClick? kColor.primaryColor : kColor.defalutBorderColor),
          )

        ),
        child:  Text(
            categoryList[index].firstCategoryName,
            style: TextStyle(
                fontSize: 20,
                color:isClick? kColor.primaryColor : Colors.black
            )
        ),

      ),
    );




}
  // 获取分类左侧数据
  _getCategory() async {
    await request("getCategory", formData: null).then((val) {


      var data = json.decode(val.toString());

      CategoryModel model = CategoryModel.fromJson(data);

      //
      setState(() {

        categoryList = model.data;


      });


      Provide.value<CategoryProvide>(context).getSecondCategoryData(categoryList[0].secondCategoryVO, '4');


      
    });
  }


}

//右侧组件
class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("右侧"),
    );
  }
}

//商品列表组件
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("商品列表组件"),
    );
  }
}

