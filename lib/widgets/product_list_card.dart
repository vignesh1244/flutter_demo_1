import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/product_details.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:groceryapp/widgets/small_square_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductListCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String weight;
  final List<String> images;
  final bool greyCard;

  ProductListCard(
    this.greyCard, {
    required this.title,
    required this.description,
    required this.price,
    required this.weight,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.002, right: width * 0.04),
      child: InkWell(
        onTap: () {
          Get.to(() => ProductDetails(
                title: title,
                description: description,
                weight: weight,
                price: price,
                images: images,
              )
          );
        },
        // borderRadius: BorderRadius.circular(borderRadius),

        child: Container(

          padding: EdgeInsets.all(width * 0.025),
          decoration: BoxDecoration(

            // border: Border.all(color: Colors.blueAccent),
            // color: greyCard ? Colors.grey.withOpacity(0.1) : Colors.transparent,
            // borderRadius: BorderRadius.circular(borderRadius),
            borderRadius: BorderRadius.circular(80),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(

                children: [
                  Container(
                    padding: EdgeInsets.all(width * 0.01),
                    decoration: BoxDecoration(
                        color: greyCard ? white : Colors.grey.withOpacity(0.1),
                        // borderRadius: BorderRadius.circular(borderRadius / 2)
                        borderRadius: BorderRadius.circular(50),
                        ),
                    width: width * 0.2,
                    height: width * 0.2,
                    child: CachedNetworkImage(
                      imageUrl: images[0],
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    width: width * 0.3,
                    height: height* 0.035,
                    child: Center(
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    weight,
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              Container(

                padding: EdgeInsets.fromLTRB(2, 3, 10, 3),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    // SmallSquareButton(
                    //     FeatherIcons.plus, () {}
                    // ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.pinkAccent),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(13.0, 4.0, 13.0, 4.0),
                        child: Text('ADD',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 9.sp,
                        ),),
                      ),
                    )
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
