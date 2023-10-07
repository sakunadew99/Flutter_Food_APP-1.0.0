import 'package:get/get.dart';
import 'package:my_first_app/controller/popular_product_controller.dart';
import 'package:my_first_app/controller/recommended_product_controller.dart';
import 'package:my_first_app/data/api/api_client.dart';
import 'package:my_first_app/data/repository/popular_product_repo.dart';
import 'package:my_first_app/data/repository/recommended_product_repo.dart';
import 'dart:async';

import 'package:my_first_app/utils/app_constrant.dart';



Future<void> init()async{
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConsteant.BASE_URL));

  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>RecommendedProductRepo(apiClient: Get.find()));


  Get.lazyPut(()=>popularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(()=>recommendedProductController(recommendedProductRepo:Get.find()));
}