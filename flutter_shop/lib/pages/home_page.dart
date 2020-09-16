
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../config/index.dart';
import '../service/http_service.dart';

import 'dart:convert'; //解析数据用的

import 'package:flutter_swiper/flutter_swiper.dart'; //轮播组件
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


//AutomaticKeepAliveClientMixin 切换TabBar的时候不会重复绘制
class _HomePageState extends State<HomePage>  with AutomaticKeepAliveClientMixin {


// 防止刷新处理 保持当前状态
  @override 
  bool get wantKeepAlive => true;

  @override 
  void initState() { 
    super.initState();
    print("首页刷新了");
  }

  // 刷新控件 只刷新有变化的
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();



  


  @override
  Widget build(BuildContext context) {
    super.build(context);
  return Scaffold(
    backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
    appBar: AppBar(
      title: Text(kString.homeTitle),
    ),
      //请求数据
      body:FutureBuilder(
        future: request(kUrl.home_getHomePageContent_url,formData:null), 
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data  = json.decode(snapshot.data.toString());
            print(data);
            List <Map> swipeList = (data['data']['slides'] as List).cast() ; //轮播图
            List <Map> categoryList = (data['data']['category'] as List).cast() ; //分类
            List <Map> recommendList = (data['data']['recommend'] as List).cast() ; //推荐     
            List <Map> floor1List = (data['data']['floor1'] as List).cast() ;  //商品推荐底部 
            Map  floor1PicMap = data['data']['floor1Pic'];  //广告
            

            // 刷新
            return EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerKey,
                bgColor: Colors.white,
                textColor: kColor.refreshTextColor,
                moreInfoColor: kColor.refreshTextColor,
                showMore: true,
                noMoreText: '',
                moreInfo: kString.loading,//加载中
                loadReadyText: kString.loadReadyText, //上拉加载

              ),
              // 内容主体部分
               child: ListView(
                 children: <Widget>[
                  //  轮播图
                   SwiperDiy(
                     swipeList: swipeList,
                   ),
                  //  分类导航
                   CategoryView(
                     categoryList: categoryList,
                   ),
                  //商品推荐
                  RecommandView(
                    recommandList: recommendList,
                  ),
                  //广告页
                  FloorPicView(
                    floor1Pic: floor1PicMap,
                  ),
                  //推荐下层
                  FloorView(
                    floor1List: floor1List,
                  ),

                 ],
              ),
              loadMore: ()async{
                print('加载更多');
              },
            );

          
          }else{
            return Container(
              child: Text("加载中..."),
            );
          }
        },
      ),

  );
  }
  
}

//首页轮播组件
class SwiperDiy extends StatelessWidget {

  final List swipeList;
  //构建函数
  SwiperDiy({Key key, this.swipeList}) : super(key:key);

  // 重绘组件
    @override
   Widget build(BuildContext context) {
     return Container(
       color:Colors.white,
       height:ScreenUtil().setHeight(300),
       width:ScreenUtil().setWidth(750),
       child: Swiper(
        //  如何构建
         itemBuilder: (BuildContext context,int index ){
           return InkWell(
             onTap: (){
               print("---------$index----------");
             },
            
             child: Image.network("${swipeList[index]['image']}",fit: BoxFit.cover,),

           );

         },
         itemCount: swipeList.length,
         pagination: SwiperPagination(),  //分页
         autoplay: true,
         ),

     );
   }
}


//分类category
class CategoryView extends StatelessWidget {

  final List categoryList;
  //构建函数
  CategoryView({Key key, this.categoryList}) : super(key:key);
  Widget _gridViewItemUI(BuildContext context,item,index){
    return InkWell(
      onTap: (){
        print("跳转分类导航-----$index");
      },
      child: Column(
          children: <Widget>[
            Image.network(item["image"],width: ScreenUtil().setWidth(100),),
            Text(item["firstCategoryName"])
            ],
      ),

    );
  }
    @override
   Widget build(BuildContext context) {

     //判断
     if(categoryList.length > 10){
       categoryList.removeRange(10, categoryList.length);

     }
     var tempIndex =  -1 ;
     return Container( 
       color: Colors.white,
       height: ScreenUtil().setHeight(260),
       margin: EdgeInsets.only(top:10.0),
       padding: EdgeInsets.all(3.0),
      //  GridView.count
      // crossAxisCount多少列
       child: GridView.count(
         crossAxisCount: 5,
       padding: EdgeInsets.fromLTRB(4, 10, 4, 10),
         physics:  NeverScrollableScrollPhysics(), //禁止滚动
         children:categoryList.map((item){
           tempIndex++;
          return _gridViewItemUI(context,item,tempIndex);
         }).toList(),  //数组  采用map的方式进行创建 
        //  需转成.toList() 否则会报type 'MappedListIterable<Map<dynamic, dynamic>, Widget>' is not a subtype of type 'List<Widget>'

       ),
     );
   }
}

//商品推荐
class RecommandView extends StatelessWidget {

  final List recommandList;
  //构建函数
  RecommandView({Key key, this.recommandList}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top:10.0),
      child: Column(

        children: <Widget>[
          _recommandTitle(),
          _recommandListView(context),
        ],

      ),
      
    );
  }


  //推荐商品title
  Widget _recommandTitle(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      decoration: BoxDecoration(
        color:Colors.white,
        border: Border(
          bottom: BorderSide(width:0.5,color:kColor.defalutBorderColor),
        )
      ),
      child: Text(
        kString.kHomeReCommandTitle,
        style: TextStyle(
          color:Colors.black26,
        ),
      ),
    );
  }
  //推荐商品item
  Widget _getItems(index,context){

       return  InkWell(
            onTap: (){
               print("-----推荐商品item----$index----------");
             },
           child: Container(
               width: ScreenUtil().setWidth(280),
               padding:EdgeInsets.all(10.0),
               decoration: BoxDecoration(
                 color:Colors.white,
                 border:Border(
                   left: BorderSide(width: 0.5, color: kColor.defalutBorderColor),

                 )
               ),
               child: Column(

                children: <Widget>[
                  //防止溢出组件
                  Expanded(

                    child: Image.network(recommandList[index]["image"],fit: BoxFit.cover,)

                    ),

                  // Text(recommandList[index]['name']),
                  Text('￥${recommandList[index]["presentPrice"]}',
                  style: kFont.priceStyle,
                  ),
                  Text('￥${recommandList[index]["oriPrice"]}',

                  style: kFont.oriPriceStyle,
                  )

                ],  
                
               ),

           ),   
     
       );

    }

// 商品推荐列表
    @override
   Widget _recommandListView(BuildContext context) {

     return Container( 
       height: ScreenUtil().setHeight(380),
       child: ListView.builder(
         scrollDirection: Axis.horizontal, //水平方向
         itemCount: recommandList.length,
         itemBuilder: (context,index){
           return _getItems(index,context);
         }
         ),
     );
   }
}

//广告位 
class FloorPicView extends StatelessWidget{

  final Map floor1Pic;

  FloorPicView({Key key, this.floor1Pic}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
    
      height: ScreenUtil().setHeight(150),
      child: InkWell(
         child: Image.network(
           floor1Pic['PICTURE_ADDRESS'],
           fit: BoxFit.cover,
         ),  

      ),


    );
  }

}


// 推荐下层
class FloorView extends StatelessWidget{

    final List floor1List;

    void jumpGoodsDetail(context,goodsId){

      print("跳转到商品详情${goodsId}");
    }


    FloorView({Key key, this.floor1List}) : super(key:key);


    @override
  Widget build(BuildContext context) {
    //
    return Container(
       child: Row(

         children: <Widget>[

           //左侧商品
           Expanded(
             child: Column(
               children: <Widget>[

                 Container(
                   padding: EdgeInsets.only(top:4),
                      height: 400,
                      child: InkWell(
                       child: Image.network(floor1List[0]["image"],fit: BoxFit.cover,),
                      onTap: (){
                            
                          jumpGoodsDetail(context, floor1List[0]["goodsId"]);  

                      },
                      ),
                     

                 ),
                 Container(
                   padding: EdgeInsets.only(top:4),
                      height: 200,
                      child: InkWell(
                       child: Image.network(floor1List[1]["image"],fit: BoxFit.cover,),
                      onTap: (){
                            
                          jumpGoodsDetail(context, floor1List[1]["goodsId"]);  

                      },
                      ),
                                           
                 ),

  
               ],
               
             ),
             ),
            //右侧商品
             Expanded(
               child: Column(
                 children: <Widget>[

                      Container(
                   padding: EdgeInsets.only(top:4),
                      height: 200,
                      child: InkWell(
                       child: Image.network(floor1List[2]["image"],fit: BoxFit.cover,),
                      onTap: (){
                            
                          jumpGoodsDetail(context, floor1List[2]["goodsId"]);  

                      },
                      ),
                     

                 ),
                 Container(
                   padding: EdgeInsets.only(top:4),
                      height: 200,
                      child: InkWell(
                       child: Image.network(floor1List[3]["image"],fit: BoxFit.cover,),
                      onTap: (){
                            
                          jumpGoodsDetail(context, floor1List[3]["goodsId"]);  

                      },
                      ),
                                           
                 ),

  
     Container(
                   padding: EdgeInsets.only(top:4),
                      height: 200,
                      child: InkWell(
                       child: Image.network(floor1List[4]["image"],fit: BoxFit.cover,),
                      onTap: (){
                            
                          jumpGoodsDetail(context, floor1List[4]["goodsId"]);  

                      },
                      ),
                     

                 ),
       
  

                 ],
               )
             )

         ],
       ),


    );
  }




}
