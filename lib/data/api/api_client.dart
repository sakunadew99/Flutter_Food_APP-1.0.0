import 'package:get/get.dart';
import 'dart:async';

import 'package:my_first_app/utils/app_constrant.dart';


class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  late Map<String,String> _mainHeaders;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token=AppConsteant.TOKEN;
    _mainHeaders ={
      'Content-Type':'application/json ; charset=UTF-8',
      'Authorization':'Bearer $token',
      //'Accept':'application/json',
    };
  }
  Future<Response> getData(String uri,) async{
    try{
      Response response = await get(uri,);
      return response;
    }
    catch(e){
      return Response(statusCode:1,statusText: e.toString());
    }
  }
}