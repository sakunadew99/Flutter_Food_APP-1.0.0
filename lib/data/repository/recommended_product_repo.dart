import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_first_app/data/api/api_client.dart';
import 'dart:async';

import 'package:my_first_app/utils/app_constrant.dart';


class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getrecommendedProducts() async{
    //final response = await apiClient.get('recommended-products');
    //return response;
    return await apiClient.getData(AppConsteant.RECOMMENDED_PRODUCT);
  }
}