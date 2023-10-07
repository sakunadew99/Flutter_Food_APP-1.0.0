import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/small_text.dart';
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


class exdanbleText extends StatefulWidget {
  final String text;
  const exdanbleText({super.key,required this.text});

  @override
  State<exdanbleText> createState() => _exdanbleTextState();
}

class _exdanbleTextState extends State<exdanbleText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState() {
    super.initState();
    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:secondHalf.isEmpty?SmallText(size:Dimensions.font16,text: firstHalf):Column(
        children: [
          SmallText(size:Dimensions.font16,text:hiddenText?(firstHalf + "..."): (firstHalf + secondHalf),color: Color.fromARGB(127, 0, 0, 0),),  
          InkWell(
            onTap:(){
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child:Row(
              children: [
              SmallText(text: hiddenText?"show more":"show less",color: Colors.blue,),
              Icon(hiddenText?Icons.arrow_drop_down_rounded:Icons.arrow_drop_up_rounded,color: Colors.blue,)
            ],
            )
            
          )
        ],
      ),
    );
  }
}