import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_first_app/data/api/api_client.dart';
import 'dart:async';

import 'package:my_first_app/utils/app_constrant.dart';


class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProducts() async{
    //final response = await apiClient.get('popular-products');
    //return response;
    return await apiClient.getData(AppConsteant.POPULAR_PRODUCT);
  }
}