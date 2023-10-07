import 'package:flutter/material.dart';
import 'package:my_first_app/controller/popular_product_controller.dart';
import 'package:my_first_app/controller/recommended_product_controller.dart';
import 'package:my_first_app/pages/food/Recommended_food_details.dart';
import 'package:my_first_app/pages/food/popular_food_details.dart';
import 'package:my_first_app/pages/home/food_page_body.dart';
import 'package:my_first_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<popularProductController>().getPopularProductsList();
    Get.find<recommendedProductController>().getrecommendedProductsList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
    );
  }
}

