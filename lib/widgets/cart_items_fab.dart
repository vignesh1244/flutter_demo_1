import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/screens/cart.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemsFAB extends StatelessWidget {
  final int itemsCount;
  CartItemsFAB(this.itemsCount);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      onPressed: () {
        Get.to(() => Cart());
      },
      label: Padding(
        padding: EdgeInsets.all(width * 0.02),
        child: Row(
          children: [
            Icon(
              FeatherIcons.shoppingBag,
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              "$itemsCount items in cart",
              style: TextStyle(fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
