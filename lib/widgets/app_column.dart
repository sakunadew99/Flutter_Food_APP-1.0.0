import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/app_icon.dart';
import 'package:my_first_app/widgets/big_text.dart';
import 'package:my_first_app/widgets/small_text.dart';
import 'package:my_first_app/widgets/icon_and_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: text,size: Dimensions.font26,),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      children: [
                        Wrap(
                          children:List.generate(5, (index) => Icon(Icons.star,color: Colors.yellow,size: 15,)),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10,),
                        SmallText(text: "12987"),
                        SizedBox(width: 10,),
                        SmallText(text: "comments"),
                      ],
                   
                    
                    ), 
                  SizedBox(height: Dimensions.height20),
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
                );
  }
}