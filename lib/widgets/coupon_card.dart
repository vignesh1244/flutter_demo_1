import 'package:flutter/material.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CouponCard extends StatelessWidget {
  final bool showProgress;
  final String progressText;
  final double progressValue;
  
  CouponCard({
    this.showProgress = false,
    this.progressText = "",
    this.progressValue = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    return Container(
      margin: EdgeInsets.only(
        top: width * 0.04,
        left: width * 0.04,
        right: width * 0.04,
        bottom: 0,
      ),
      padding: EdgeInsets.all(width * 0.03),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey.withOpacity(0.4),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "15% off",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Row(children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  child: Text(
                    "123BCD",
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                    side: BorderSide(
                      color: primaryColor,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  child: Text(
                    "Redeem",
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                ),
              ]),
            ],
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Text(
            "Applies to first purchase",
            style: TextStyle(
              fontSize: 12.sp,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Valid until 27 October 2021",
            style: TextStyle(
              color: textColor,
              fontSize: 10.sp,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          showProgress
              ? Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progressValue,
                        color: primaryColor,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      progressText,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
