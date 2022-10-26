import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/cart.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/coupon_card.dart';
import 'package:provider/provider.dart';

class Coupons extends StatefulWidget {
  @override
  _CouponsState createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            FeatherIcons.chevronLeft,
                            color: textColor,
                          ),
                          tooltip: "Back",
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          "My Coupons",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => Cart());
                          },
                          icon: Icon(
                            FeatherIcons.shoppingBag,
                            color: primaryColor,
                          ),
                          tooltip: "Cart",
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            width: width * 0.045,
                            height: width * 0.045,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "4",
                              style: TextStyle(color: white, fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CouponCard(),
              CouponCard(
                showProgress: true,
                progressText: "\$ 30 / \$ 50",
                progressValue: 0.6,
              ),
              CouponCard(
                showProgress: true,
                progressText: "4 / 5 orders",
                progressValue: 0.8,
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: primaryColor,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.card_giftcard),
                          SizedBox(width: width * 0.01),
                          Text(
                            "Enter other promo code",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
