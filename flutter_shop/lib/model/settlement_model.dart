class SettlementModel {
  String code;
  String message;
  Data data;

  SettlementModel({this.code, this.message, this.data});

  SettlementModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String uid;
  int floorId;
  String floorName;
  BannerInfo bannerInfo;
  DeliveryAddress deliveryAddress;
  SettleDelivery settleDelivery;
  String deliveryDesc;
  Null couponInfo;
  String deliveryFee;
  String packageFee;
  String promotionFee;
  String couponFee;
  String deliveryCouponFee;
  String totalAmount;
  bool isSupportInvoice;
  List<InCaseOfShortageList> inCaseOfShortageList;
  bool isSelectShoppingNotes;

  Data(
      {
      this.uid,
      this.floorId,
      this.floorName,
      this.bannerInfo,
      this.deliveryAddress,
      this.settleDelivery,
      this.deliveryDesc,
      this.couponInfo,
      this.deliveryFee,
      this.packageFee,
      this.promotionFee,
      this.couponFee,
      this.deliveryCouponFee,
      this.totalAmount,
      this.isSupportInvoice,
      this.inCaseOfShortageList,
      this.isSelectShoppingNotes});

  Data.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    floorId = json['floorId'];
    floorName = json['floorName'];
    bannerInfo = json['bannerInfo'] != null
        ? new BannerInfo.fromJson(json['bannerInfo'])
        : null;
    deliveryAddress = json['deliveryAddress'] != null
        ? new DeliveryAddress.fromJson(json['deliveryAddress'])
        : null;
    settleDelivery = json['settleDelivery'] != null
        ? new SettleDelivery.fromJson(json['settleDelivery'])
        : null;
    deliveryDesc = json['deliveryDesc'];
    couponInfo = json['couponInfo'];
    deliveryFee = json['deliveryFee'];
    packageFee = json['packageFee'];
    promotionFee = json['promotionFee'];
    couponFee = json['couponFee'];
    deliveryCouponFee = json['deliveryCouponFee'];
    totalAmount = json['totalAmount'];
    isSupportInvoice = json['isSupportInvoice'];
    if (json['inCaseOfShortageList'] != null) {
      inCaseOfShortageList = new List<InCaseOfShortageList>();
      json['inCaseOfShortageList'].forEach((v) {
        inCaseOfShortageList.add(new InCaseOfShortageList.fromJson(v));
      });
    }
    isSelectShoppingNotes = json['isSelectShoppingNotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['floorId'] = this.floorId;
    data['floorName'] = this.floorName;
    if (this.bannerInfo != null) {
      data['bannerInfo'] = this.bannerInfo.toJson();
    }
    if (this.deliveryAddress != null) {
      data['deliveryAddress'] = this.deliveryAddress.toJson();
    }
    if (this.settleDelivery != null) {
      data['settleDelivery'] = this.settleDelivery.toJson();
    }
    data['deliveryDesc'] = this.deliveryDesc;
    data['couponInfo'] = this.couponInfo;
    data['deliveryFee'] = this.deliveryFee;
    data['packageFee'] = this.packageFee;
    data['promotionFee'] = this.promotionFee;
    data['couponFee'] = this.couponFee;
    data['deliveryCouponFee'] = this.deliveryCouponFee;
    data['totalAmount'] = this.totalAmount;
    data['isSupportInvoice'] = this.isSupportInvoice;
    if (this.inCaseOfShortageList != null) {
      data['inCaseOfShortageList'] =
          this.inCaseOfShortageList.map((v) => v.toJson()).toList();
    }
    data['isSelectShoppingNotes'] = this.isSelectShoppingNotes;
    return data;
  }
}

class BannerInfo {
  String deliveryDelayTips;

  BannerInfo({this.deliveryDelayTips});

  BannerInfo.fromJson(Map<String, dynamic> json) {
    deliveryDelayTips = json['deliveryDelayTips'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deliveryDelayTips'] = this.deliveryDelayTips;
    return data;
  }
}

class DeliveryAddress {
  String addressId;
  String addressTag;
  String countryName;
  String provinceName;
  String cityName;
  String districtName;
  String detailAddress;
  String name;
  String phone;
  String latitude;
  String longitude;
  bool isDefault;

  DeliveryAddress(
      {this.addressId,
      this.addressTag,
      this.countryName,
      this.provinceName,
      this.cityName,
      this.districtName,
      this.detailAddress,
      this.name,
      this.phone,
      this.latitude,
      this.longitude,
      this.isDefault});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    addressId = json['addressId'];
    addressTag = json['addressTag'];
    countryName = json['countryName'];
    provinceName = json['provinceName'];
    cityName = json['cityName'];
    districtName = json['districtName'];
    detailAddress = json['detailAddress'];
    name = json['name'];
    phone = json['phone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressId'] = this.addressId;
    data['addressTag'] = this.addressTag;
    data['countryName'] = this.countryName;
    data['provinceName'] = this.provinceName;
    data['cityName'] = this.cityName;
    data['districtName'] = this.districtName;
    data['detailAddress'] = this.detailAddress;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isDefault'] = this.isDefault;
    return data;
  }
}

class SettleDelivery {
  int deliveryType;
  String deliveryName;
  Null deliveryDesc;
  Null expectArrivalTime;
  Null expectArrivalEndTime;
  String storeDeliveryTemplateId;
  List<String> deliveryModeIdList;
  String areaBlockId;
  String areaBlockName;

  SettleDelivery(
      {this.deliveryType,
      this.deliveryName,
      this.deliveryDesc,
      this.expectArrivalTime,
      this.expectArrivalEndTime,
      this.storeDeliveryTemplateId,
      this.deliveryModeIdList,
      this.areaBlockId,
      this.areaBlockName});

  SettleDelivery.fromJson(Map<String, dynamic> json) {
    deliveryType = json['deliveryType'];
    deliveryName = json['deliveryName'];
    deliveryDesc = json['deliveryDesc'];
    expectArrivalTime = json['expectArrivalTime'];
    expectArrivalEndTime = json['expectArrivalEndTime'];
    storeDeliveryTemplateId = json['storeDeliveryTemplateId'];
    deliveryModeIdList = json['deliveryModeIdList'].cast<String>();
    areaBlockId = json['areaBlockId'];
    areaBlockName = json['areaBlockName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deliveryType'] = this.deliveryType;
    data['deliveryName'] = this.deliveryName;
    data['deliveryDesc'] = this.deliveryDesc;
    data['expectArrivalTime'] = this.expectArrivalTime;
    data['expectArrivalEndTime'] = this.expectArrivalEndTime;
    data['storeDeliveryTemplateId'] = this.storeDeliveryTemplateId;
    data['deliveryModeIdList'] = this.deliveryModeIdList;
    data['areaBlockId'] = this.areaBlockId;
    data['areaBlockName'] = this.areaBlockName;
    return data;
  }
}

class InCaseOfShortageList {
  int shortageId;
  String shortageDesc;
  bool isDefault;

  InCaseOfShortageList({this.shortageId, this.shortageDesc, this.isDefault});

  InCaseOfShortageList.fromJson(Map<String, dynamic> json) {
    shortageId = json['shortageId'];
    shortageDesc = json['shortageDesc'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shortageId'] = this.shortageId;
    data['shortageDesc'] = this.shortageDesc;
    data['isDefault'] = this.isDefault;
    return data;
  }
}