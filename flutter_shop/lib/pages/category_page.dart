import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import '../config/index.dart';

import '../model/category_model.dart';

import 'package:flutter_shop/provide/category_provide.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_shop/provide/category_goods_list_provide.dart';

import '../model/category_goods_list_model.dart';
import '../provide/category_goods_list_provide.dart';

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
        ));
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
  var selectedIndex = 0; //默认选中第一个

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
      builder: (context, child, value) {
//        print('点击了${categoryLeftList[value.categoryIndex].firstCategoryName}');

        selectedIndex = value.categoryIndex;

        return Container(
          width: ScreenUtil().setWidth(180.0),
          decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1, color: kColor.defalutBorderColor)),
          ),
          child: ListView.builder(
              itemCount: categoryLeftList.length,
              itemBuilder: (context, index) {
                return _leftInkWell(index);
              }),
        );
      },
    );
  }

//
  Widget _leftInkWell(int index) {
    bool isClick = false;

    isClick = (index == selectedIndex) ? true : false;

    return InkWell(
      onTap: () {
        //获取二级分类的数据
        var subCategoryList = categoryLeftList[index].secondCategoryVO;

        var categoryId = categoryLeftList[index].firstCategoryId;

        Provide.value<CategoryProvide>(context)
            .changeCategory(categoryId, index);

        Provide.value<CategoryProvide>(context)
            .getSubCategory(subCategoryList, categoryId);

        //获取商品列表
        _getGoodsList(context, categoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(90),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: kColor.defalutBorderColor),
            left: BorderSide(
                width: 2, color: isClick ? kColor.primaryColor : Colors.white),
          ),
        ),
        child: Text(
          categoryLeftList[index].firstCategoryName,
          style: TextStyle(
            color: isClick ? kColor.primaryColor : Colors.black,
            fontSize: ScreenUtil().setSp(30),
          ),
        ),
      ),
    );
  }

  // 获取分类数据
  _getCategoryData() async {
    await request(kUrl.category_getCategory, formData: null).then((value) {
      var data = json.decode(value.toString());
//    print('分类数据$data');

      CategoryModel model = CategoryModel.fromJson(data);

      setState(() {
        categoryLeftList = model.data;
      });

      Provide.value<CategoryProvide>(context)
          .getSubCategory(categoryLeftList[0].secondCategoryVO, '0');
    });
  }

  _getGoodsList(context, fristCategoryId) {
    var data = {
//      'fristCategoryId': fristCategoryId == null ? Provide.value<CategoryProvide>(context).categoryId,
      'fristCategoryId': Provide.value<CategoryProvide>(context).categoryId,
      'secondCategoryId': Provide.value<CategoryProvide>(context).subCategoryId,
      'page': 1
    };

    request(kUrl.category_getCategoryGoods, formData: data).then((value) {
      var data = json.decode(value.toString());

      print("datadata+++${data}");

//      1.解析数据
      CategoryGoodsListModel goodsListModel =
          CategoryGoodsListModel.fromJson(data);

//      2.取出数据模型
      Provide.value<CategoryGoodsListProvide>(context)
          .getGoodsList(goodsListModel.data);

      Provide.value<CategoryGoodsListProvide>(context).goodsList =
          goodsListModel.data;
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
      child:
          Provide<CategoryProvide>(builder: (context, child, categoryProvide) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: MediaQuery.of(context).size.width - ScreenUtil().setWidth(180),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 1, color: kColor.defalutBorderColor),
              )),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryProvide.subCategoryGoodsList.length,
              itemBuilder: (context, index) {
                return _rightInkWell(
                    index, categoryProvide.subCategoryGoodsList[index]);
              }),
        );
      }),
    );
  }

//  右侧顶部点击事件
  Widget _rightInkWell(int index, SecondCategoryVO item) {
    bool isClick = false;

    isClick =
        (index == Provide.value<CategoryProvide>(context).subCategoryIndex)
            ? true
            : false;

    return InkWell(
      onTap: () {
        Provide.value<CategoryProvide>(context)
            .changeSubCategory(item.secondCategoryId, index);
        //获取商品列表
        _getGoodsList(index, item.secondCategoryId);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
        child: Center(
          child: Text(
            item.secondCategoryName,
            style: TextStyle(
              color: isClick ? kColor.primaryColor : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

}


//商品列表数据
void _getGoodsList(context, String subcategoryId, {bool isLodaMore}) {

  var page = isLodaMore ? Provide.value<CategoryProvide>(context).page : 1;
 var secondCategoryId = isLodaMore ?   Provide.value<CategoryProvide>(context).subCategoryId : subcategoryId;

  var data = {
    'firstCategoryId':Provide.value<CategoryProvide>(context).categoryId,
    'secondCategoryId': secondCategoryId,
    'page': page
  };

  request('getCategoryGoods', formData: data).then((val) {
    var data = json.decode(val.toString());
    print('getCategoryGoods secondCategory:::' + data.toString());
    CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);

    if (goodsList.data == null) {

      if(isLodaMore){

        Provide.value<CategoryProvide>(context).changeNoMore("没有更多了");

      }else{

        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);

      }
    } else {

      if(isLodaMore){

        Provide.value<CategoryGoodsListProvide>(context).addGoodsList(goodsList.data);

      }else{

        Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);

      }

    }
  });
}


// 商品列表
class CategoryGoodsListView extends StatefulWidget {
  @override
  _CategoryGoodsListViewState createState() => _CategoryGoodsListViewState();
}

class _CategoryGoodsListViewState extends State<CategoryGoodsListView> {
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();

  // 滚动控制
  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, data) {
        //分类切换时滚动到顶部处理
        try {
          if (Provide.value<CategoryProvide>(context).page == 1) {
            scrollController.jumpTo(0.0);
          }
        } catch (error) {
          print("分类商品列表异常:$error");
        }

        if (data.goodsList.length > 0) {
          return Expanded(
              child: Container(
            width:
                MediaQuery.of(context).size.width - ScreenUtil().setWidth(180),
            child: EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerKey,
//                bgColor: ,
              ),
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: data.goodsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _GoodsListWidget(data.goodsList, index);
                  }),
              //加载更多
              loadMore: () async{

                if(Provide.value<CategoryProvide>(context).noMoreText == "没有更多了"){

                  Fluttertoast.showToast(
                      msg: "已经到底了",
                      toastLength:Toast.LENGTH_LONG,
                      gravity:ToastGravity.CENTER,
                  );

                }else{

                  _getGoodsList(context, "",isLodaMore: true);
                }


              },
            ),
          ));
        } else {
          return Text("暂无数据");
        }
      },
    );
  }

  Widget _GoodsListWidget(List dataList, int index) {
    return InkWell(
      onTap: () {
//        TODO 跳转到商品详情
        print("跳转到商品详情");
      },
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1, color: kColor.defalutBorderColor),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _goodsImage(dataList, index),
            Column(
              children: [
                _goodsName(dataList, index),
                _goodsPrice(dataList, index),
              ],
            )
          ],
        ),
      ),
    );
  }

  //商品图片
  Widget _goodsImage(List dataList, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(dataList[index].image),
    );
  }

  //商品名字
  Widget _goodsName(List dataList, int index) {
    return Container(
        width:
            MediaQuery.of(context).size.width - ScreenUtil().setWidth(380) - 16,
        margin: EdgeInsets.only(top: 5, left: 8, right: 8),
        child: Text(
          dataList[index].name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
          ),
        ));
  }

  //商品价格
  Widget _goodsPrice(List dataList, int index) {
    return Container(
      width:
          MediaQuery.of(context).size.width - ScreenUtil().setWidth(380) - 16,
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        children: [
          Text(
            "￥${dataList[index].presentPrice}",
            style: TextStyle(
              color: kColor.primaryColor,
            ),
          ),
          Text(
            "￥${dataList[index].oriPrice}",
            style: TextStyle(
              color: Colors.black12,
            ),
          )
        ],
      ),
    );
  }
}
