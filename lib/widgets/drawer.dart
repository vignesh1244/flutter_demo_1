import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/categories.dart';
import 'package:groceryapp/screens/coupons.dart';
import 'package:groceryapp/screens/customer_support.dart';
import 'package:groceryapp/screens/login_register.dart';
import 'package:groceryapp/screens/product_request.dart';
import 'package:groceryapp/screens/top_deals.dart';
import 'package:groceryapp/screens/track_order.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/menu_button.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(width * 0.03),
        width: width * 0.8,
        height: height,
        decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context).isDarkTheme
              ? Provider.of<ThemeProvider>(context).scaffoldColor
              : primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    FeatherIcons.x,
                    color: white,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: width * 0.07,
                      backgroundColor:
                          Provider.of<ThemeProvider>(context).isDarkTheme
                              ? primaryColor.withOpacity(0.5)
                              : white.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aqeel Shamz",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          "+1234567890",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                MenuButton(
                  () {
                    Get.to(
                      () => Categories(),
                    );
                  },
                  FeatherIcons.list,
                  "All categories",
                ),
                MenuButton(
                  () {
                    Get.to(
                      () => TopDeals(),
                    );
                  },
                  FeatherIcons.trendingUp,
                  "Top Deals",
                ),
                MenuButton(
                  () {
                    Get.to(
                      () => ProductRequest(),
                    );
                  },
                  FeatherIcons.fileText,
                  "Make product request",
                ),
                MenuButton(
                  () {
                    Get.to(
                      () => TrackOrder(),
                    );
                  },
                  FeatherIcons.mapPin,
                  "Track your order",
                ),
                MenuButton(
                  () {
                    Get.to(
                      () => Coupons(),
                    );
                  },
                  Icons.card_giftcard,
                  "Coupons",
                ),
                MenuButton(
                  () {
                    Get.to(() => CustomerSupport());
                  },
                  FeatherIcons.messageCircle,
                  "Live Chat",
                ),
              ],
            ),
            Column(
              children: [
                MenuButton(
                  () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme(
                      !Provider.of<ThemeProvider>(context, listen: false)
                          .isDarkTheme,
                    );
                  },
                  Provider.of<ThemeProvider>(context).isDarkTheme
                      ? FeatherIcons.sun
                      : FeatherIcons.moon,
                  Provider.of<ThemeProvider>(context).isDarkTheme
                      ? "Light Mode"
                      : "Dark Mode",
                  autoClose: false,
                ),
                MenuButton(
                  () {
                    Get.offAll(
                      () => LoginRegister(),
                    );
                  },
                  FeatherIcons.logOut,
                  "Logout",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
