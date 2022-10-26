import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallProductCard extends StatelessWidget {
  final String image;
  final String title;


  SmallProductCard({required this.image, required this.title, } );

  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(width * 0.02),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(width * 0.01),
              width: width * 0.1,
              height: width * 0.1,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                filterQuality: FilterQuality.high,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width * 0.15,
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontSize: 10.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
