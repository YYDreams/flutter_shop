class CartModel{
  String image;
  String name;
  String goodsId;
  int count;
  bool isCheck;
  double price;


  CartModel({this.image,this.name,this.goodsId,this.price,this.count,this.isCheck});

  CartModel.fromJson(Map<String,dynamic> json){
    image = json['image'];
    name = json['name'];
    goodsId = json['goodsId'];
    price = json['price'];
    count = json['count'];
    isCheck = json['isCheck'];


  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    data['count'] = this.count;
    data['isCheck'] = this.isCheck;
    return data;
  }

}
