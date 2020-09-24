class CategoryGoodsListModel{
  String code;
  String message;
  List<CategoryListData> data;


  CategoryGoodsListModel({this.code,this.message,this.data});

  CategoryGoodsListModel.fromJson(Map<String,dynamic> json){
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = new List<CategoryListData>();
      json['data'].forEach((v){
        data.add(new CategoryListData.fromJson(v));
      });
    }
  }


  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if(this.data != null){
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class CategoryListData{
  String image;
  String name;
  String goodsId;
  double oriPrice;
  double presentPrice;


  CategoryListData({this.image,this.name,this.goodsId,this.oriPrice,this.presentPrice});

  CategoryListData.fromJson(Map<String,dynamic> json){
    image = json['image'];
    name = json['name'];
    goodsId = json['goodsId'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];


  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['goodsId'] = this.goodsId;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    return data;
  }

}

