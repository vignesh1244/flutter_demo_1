import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:groceryapp/widgets/small_square_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartProductListCard extends StatelessWidget {
  final String title;
  final String weight;
  final String price;
  final int quantity;
  final String image;
  final Function(DismissDirection) onDismissed;
  
  CartProductListCard({
    required this.onDismissed,
    required this.title,
    required this.weight,
    required this.price,
    required this.quantity,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    var scaffoldColor = Provider.of<ThemeProvider>(context).scaffoldColor;
    return Dismissible(
      key: Key("1"),
      onDismissed: onDismissed,
      background: Container(
        padding: EdgeInsets.only(right: width * 0.05),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Icon(
          Icons.delete,
          color: white,
        ),
      ),
      direction: DismissDirection.endToStart,
      child: Container(
        margin: EdgeInsets.only(bottom: height * 0.015, right: width * 0.04),
        padding: EdgeInsets.all(width * 0.025),
        decoration: BoxDecoration(
          color: scaffoldColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(width * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(borderRadius / 2)),
                  width: width * 0.2,
                  height: width * 0.2,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                    Text(
                      weight,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: textColor.withOpacity(0.7),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              height: height * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Row(
                    children: [
                      SmallSquareButton(FeatherIcons.minus, () {}),
                      SizedBox(width: width * 0.015),
                      Text(
                        "$quantity",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: width * 0.015),
                      SmallSquareButton(FeatherIcons.plus, () {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
