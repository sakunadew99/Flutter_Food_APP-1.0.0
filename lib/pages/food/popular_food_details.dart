import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/app_column.dart';
import 'package:my_first_app/widgets/app_icon.dart';
import 'package:my_first_app/widgets/big_text.dart';
import 'package:my_first_app/widgets/exdanble_text.dart';
import 'package:my_first_app/widgets/small_text.dart';
import 'package:my_first_app/widgets/icon_and_text_widget.dart';
import 'dart:io';

class PopularFooddetails extends StatelessWidget {
  const PopularFooddetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/pexels-jan-n-g-u-y-e-n-🍁-699953.jpg"),
                  
                ),
              ),
            ),
          ),
          Positioned(
            top : Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                ],
            )
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20)),
                color: Colors.white,
                //borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Sri lanka Delicious"),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(
                      child:SingleChildScrollView(
                        child:exdanbleText(text: "Snka is n,pawn,fish,beef and mutton. The finish itSri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish it,Sri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish itSri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish it,Sri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish itSri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish it,Sri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish itSri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish it,Sri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish itSri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish it,Sri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish itSri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish it,Sri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish itSri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish it,Sri Lanka is a country with a very unique and strong curry fish,chiken,pawn,fish,beef and mutton. The finish it",),
 
                      
                    ),
                    ),
                  ],
                )
              ),
              )
            
        ],
      ),
      bottomNavigationBar: Container(

        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height30,top: Dimensions.height30),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 202, 202, 202),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top:Dimensions.height20,bottom:Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(Icons.remove,color: Colors.black,),
                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text: "0",),
                    SizedBox(width: Dimensions.width10/2,),
                    Icon(Icons.add,color: Colors.black,),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height20,top: Dimensions.height20),
                child: BigText(text: "\$10|Add to cart",color: Colors.white,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Color.fromARGB(255, 26, 183, 255),
                ),
              )
            ],
          ),
      ),
    );
  }
}