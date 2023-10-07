import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_first_app/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroungColor;
  final Color iconColor;
  final double size;
  final double iconSize;


  AppIcon({Key? key,
  required this.icon,
  this.backgroungColor =  const Color(0xFFfcf4e4), 
  this.iconColor =  const Color(0xFF756d54),          
  this.size = 40.0,
  this.iconSize = 16,

  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
      color: backgroungColor,
      borderRadius: BorderRadius.circular(size/2),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size:iconSize,
        
      ),
    );
  }
}