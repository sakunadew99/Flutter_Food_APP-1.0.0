import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/app_icon.dart';
import 'package:my_first_app/widgets/big_text.dart';
import 'package:my_first_app/widgets/exdanble_text.dart';

class recommendedFoodDetails extends StatelessWidget {
  const recommendedFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined),
              ],
            ),

            bottom:PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                
                //color: Colors.white,
                child: Center(child: BigText(text: "Sri lanka Foods",size: Dimensions.font26,)),
                width: double.maxFinite,
                padding: EdgeInsets.only(bottom: 10,top:5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Color.fromARGB(255, 248, 96, 121),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/pexels-jan-n-g-u-y-e-n-🍁-699953.jpg",width:double.maxFinite,fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child:Column(children: [
              Container(
                child: exdanbleText(text:"Recommended Food Detailsecommended Food Detaailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Detailsecommended Food Details"),
                margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
              )
            ],)
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                icon: Icons.remove,
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
                backgroungColor: Colors.blue,

                ),

              BigText(text: " \12.50 " + " * "+" 0 ",size: Dimensions.font26,),

              AppIcon(
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
                backgroungColor: Colors.blue,
                icon: Icons.add
                ),
            ],
          ),
          ),
          Container(

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
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height20,top: Dimensions.height20),
                child: BigText(text: "\$10 | Add to cart",color: Colors.white,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Color.fromARGB(255, 26, 183, 255),
                ),
              )
            ],
          ),
      ),
        ],
      ),
    );
  }
}