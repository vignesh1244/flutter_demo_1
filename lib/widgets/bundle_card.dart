import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:groceryapp/providers/theme_provider.dart';

import 'package:groceryapp/screens/pages/home_page.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:groceryapp/widgets/small_square_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../screens/pages/profile_page.dart';
import '../screens/prodcu_det_bund.dart';
import '../screens/product_details.dart';

class BundleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String image;
  final String description;
  final Function onTap;

  BundleCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    var scaffoldColor = Provider.of<ThemeProvider>(context).scaffoldColor;
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsB(
              title: title,
              price: price,
              description: description,
              subtitle: subtitle,
              image: [image],
            ));
      },
      child: Container(
        margin: EdgeInsets.only(
          right: width * 0.025,
          left: width * 0.015,
          bottom: width * 0.04,
          top: width * 0.02,
        ),
        decoration: BoxDecoration(
          color: scaffoldColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 12,
                offset: Offset(0, 4)),
          ],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        width: width * 0.47,
        child: Padding(
          padding: EdgeInsets.all(width * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(width * 0.01),
                    width: double.infinity,
                    height: height * 0.12,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(borderRadius / 2),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.007,
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.007,
                  ),
                  Text(
                    'get it Rs. 228',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // SmallSquareButton(FeatherIcons.plus, () {}),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.pinkAccent),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(19.0, 4.0, 19.0, 4.0),
                      child: Text(
                        'ADD',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.0005,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
