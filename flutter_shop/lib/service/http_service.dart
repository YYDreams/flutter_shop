import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/index.dart';



Future request(url,{formData}) async{

try{
  Response response;

  Dio dio = Dio();
  dio.options.contentType = Headers.formUrlEncodedContentType;

  if(formData == null){

    response =  await dio.post(servicePath[url]);

  }else{
 
     response =  await dio.post(servicePath[url],data: formData);

  }
  
  if(response.statusCode == 200){
    return response;

  }else{
  throw Exception('接口请求异常！！！');

  }


}catch (error){

    return print('error:::${error}'); 
}

}