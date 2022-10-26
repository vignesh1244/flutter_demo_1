import 'package:flutter/material.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';

class SmallSquareButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  SmallSquareButton(this.icon, this.onTap);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      borderRadius: BorderRadius.circular(
        borderRadius / 2,
      ),
      child: Container(
        width: width * 0.07,
        height: width * 0.07,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(
            borderRadius / 2,
          ),
        ),
        child: Icon(
          icon,
          color: primaryColor,
        ),
      ),
    );
  }
}