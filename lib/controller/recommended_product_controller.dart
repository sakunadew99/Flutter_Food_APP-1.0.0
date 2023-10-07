import 'package:get/get.dart';
import 'package:my_first_app/models/products_model.dart';
import 'package:my_first_app/data/repository/recommended_product_repo.dart';
import 'dart:async';


class recommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  recommendedProductController({required this.recommendedProductRepo});

  List<ProductModel> _recommendedProductList=[];
   List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool isLoading = false;
  bool get isLoding => isLoading;

  Future<void> getrecommendedProductsList() async{
    Response response = await recommendedProductRepo.getrecommendedProducts();
    if(response.statusCode == 200){
     
      _recommendedProductList=[];
      _recommendedProductList.addAll(Produc.fromJson(response.body).products!);
      isLoading = true;
      update();
    }
    else{
      
    }

    
    }
  }

