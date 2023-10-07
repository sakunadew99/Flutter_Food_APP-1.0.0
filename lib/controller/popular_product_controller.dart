import 'package:get/get.dart';
import 'package:my_first_app/models/products_model.dart';
import 'package:my_first_app/data/repository/popular_product_repo.dart';
import 'dart:async';


class popularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  popularProductController({required this.popularProductRepo});

  List<ProductModel> _popualarProductList=[];
   List<ProductModel> get popularProductList => _popualarProductList;

  bool isLoading = false;
  bool get isLoding => isLoading;

  Future<void> getPopularProductsList() async{
    Response response = await popularProductRepo.getPopularProducts();
    if(response.statusCode == 200){
     
      _popualarProductList=[];
      _popualarProductList.addAll(Produc.fromJson(response.body).products!);
      isLoading = true;
      update();
    }
    else{
      
    }

    
    }
  }

