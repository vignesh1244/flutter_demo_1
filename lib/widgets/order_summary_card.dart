import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderSummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
  var textColor = Provider.of<ThemeProvider>(context).textColor;
    return Container(
      padding: EdgeInsets.all(width * 0.03),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order #1234567",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "Delivery today at 3:00 pm",
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontSize: 9.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    FeatherIcons.checkCircle,
                    color: Colors.green,
                  ),
                  SizedBox(width: width * 0.01),
                  Text(
                    "Delivered",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment method",
                style: TextStyle(
                      color: textColor,
                  fontSize: 11.sp,
                ),
              ),
              Text(
                "Cash on Delivery",
                style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 9.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
