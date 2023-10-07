import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_first_app/controller/recommended_product_controller.dart';
import 'package:my_first_app/data/repository/recommended_product_repo.dart';
import 'package:my_first_app/models/products_model.dart';
import 'package:my_first_app/controller/popular_product_controller.dart';
import 'package:my_first_app/utils/app_constrant.dart';
import 'package:my_first_app/widgets/app_column.dart';
import 'package:my_first_app/widgets/big_text.dart';
import 'package:my_first_app/widgets/icon_and_text_widget.dart';
import 'package:my_first_app/widgets/small_text.dart';
import 'dart:math';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:my_first_app/utils/dimensions.dart';



class FoodPageBody extends StatefulWidget {
  
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPAgeValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPAgeValue = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
    //super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        GetBuilder<popularProductController>(builder:(popularProducts){
          return popularProducts.isLoading?Container(
      //color: Colors.redAccent,
      height: Dimensions.pageView,
      child: PageView.builder(
        controller: pageController,
        itemCount: popularProducts.popularProductList.length,
        itemBuilder: (context, position) {
          return _buildPageItem(position,popularProducts.popularProductList[position]);
      }),
    ):CircularProgressIndicator(
      color: Colors.blue,
    );
        }),

     GetBuilder<popularProductController>(builder:(popularProducts){
       return DotsIndicator(
     dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
     position: _currentPAgeValue,
     decorator: DotsDecorator(
     activeColor: Colors.blue,
     size: const Size.square(9.0),
     activeSize: const Size(18.0, 9.0),
     activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
);
      }),

      SizedBox(height: Dimensions.height30,),
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
           BigText(text: "Reccommeded"),
           SizedBox(width: Dimensions.width10,),
           Container(
             margin: const EdgeInsets.only(bottom: 3),
             child: BigText(text: ".",color:Colors.black26,),
           ),
          SizedBox(width: Dimensions.width10,),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: SmallText(text:"Food Pairing"),
          )
          ],
        ),
      ),
      
      
        
        GetBuilder<recommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoading?
          ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        itemCount: recommendedProduct.recommendedProductList.length,
        itemBuilder: (context, index) {
          return Container(
            margin:EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
            child: Row(
              children: [
                Container(
                  width: Dimensions.ListViewImgSize,
                  height: Dimensions.ListViewImgSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white38,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConsteant.BASE_URL+AppConsteant.UPLOAD_URL+recommendedProduct.recommendedProductList[index].image!),
                      
                    ),
                  ),
                ),

                Expanded(
        child: Container(
          height: Dimensions.ListViewtextContSize,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(Dimensions.radius20),topRight: Radius.circular(Dimensions.radius20)),
            color: Colors.white,
            
          ),
          child: Padding(
            padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(text: recommendedProduct.recommendedProductList[index].name!),
                SizedBox(height: Dimensions.height10),
                SmallText(text: "Sri lanka traditional foods"),
                SizedBox(height: Dimensions.height10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(icon: Icons.circle_sharp,
                       text: "Normal", 
                       iconColor: Color.fromARGB(255, 163, 192, 0)),
    
                       IconAndTextWidget(icon: Icons.location_on,
                       text: "1.7Km", 
                       iconColor: Color.fromARGB(255, 0, 184, 129)),
    
                       IconAndTextWidget(icon: Icons.access_time_rounded,
                       text: "32min", 
                       iconColor: Color.fromARGB(253, 180, 102, 0)),
                    ],
                  )
              ],
            ),
          ),
        ),
      )
              ],
            ),
          );

        }):CircularProgressIndicator(
          color: Colors.blue,
        );

        })
      

      
      
      
      ],
    );
  } 
  Widget _buildPageItem(int index,ProductModel popularProduct){

    Matrix4 matrix = new Matrix4.identity();
    if(index == _currentPAgeValue.floor()){
      var currScale = 1.0 - (_currentPAgeValue - index) * (1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currentPAgeValue.floor()+1){
      var currScale = _scaleFactor + (_currentPAgeValue - index+1) * (1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }

    else if(index == _currentPAgeValue.floor()-1){
      var currScale = 1-(_currentPAgeValue - index) * (1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }

    else{
      var currScale = _scaleFactor;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,_height*(1-_scaleFactor)/2 , 1);

    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
            image: DecorationImage(
              fit:BoxFit.cover,
              image: NetworkImage(AppConsteant.BASE_URL+AppConsteant.UPLOAD_URL+popularProduct.image!),
          ),
        ),
      ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30,bottom: Dimensions.height30),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 10,
                  offset: Offset(0, 5), // changes position of shadow
                ),
                BoxShadow(
                  color: Colors.white,                 
                  offset: Offset(-5,0), // changes position of shadow
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5,0), // changes position of shadow
                ),
              ]
                ),
                child:Container(
                  padding: EdgeInsets.only(top:Dimensions.height15, left: Dimensions.width15,right: Dimensions.width15),
                  child: AppColumn(text:popularProduct.name!),
                ),
              
              ),
          ),
        ],
      ),
    );
      
  }
}