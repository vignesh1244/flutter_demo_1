import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/cancel_order.dart';
import 'package:groceryapp/screens/order_summary.dart';
import 'package:groceryapp/screens/track_order.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderHistoryCard extends StatelessWidget {
  final bool activeOrder;
  
  OrderHistoryCard(this.activeOrder);

  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.015),
      padding: EdgeInsets.only(
          top: width * 0.03,
          left: width * 0.03,
          right: width * 0.03,
          bottom: width * 0.02),
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
              Text(
                "Thu, 25 Aug, 2020",
                style: TextStyle(fontSize: 14.sp, color: textColor),
              ),
              Row(
                children: [
                  Text(
                    "\$ 248",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Icon(FeatherIcons.chevronRight)
                ],
              ),
            ],
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Text(
            "Order #1234567",
            style: TextStyle(
              fontSize: 13.sp,
              color: textColor.withOpacity(0.7),
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                FeatherIcons.shoppingBag,
                color: textColor.withOpacity(0.7),
              ),
              SizedBox(width: width * 0.02),
              SizedBox(
                width: width * 0.75,
                height: height * 0.1,
                child: Text(
                  "Nestle Koko Krunch Breakfast Cereal (2), Fresh Refined Sugar (2), Chicken Eggs (12 pcs), Rupchanda Soyabean Oil (1), White bread (1), Peanut Butter (1)",
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: textColor.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Row(
            children: [
              Icon(
                FeatherIcons.circle,
                color: activeOrder ? Colors.green : Colors.blue,
              ),
              SizedBox(width: width * 0.02),
              Text(
                activeOrder ? "Out for delivery" : "Delivered at 12:00 pm",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: activeOrder ? Colors.green : Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.02,
                    ),
                  ),
                  onPressed: () {
                    if (activeOrder) {
                      Get.to(() => CancelOrder());
                    }
                  },
                  child: Text(
                    activeOrder ? "Cancel order" : "Ask Refund",
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.02,
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => activeOrder ? TrackOrder() : OrderSummary());
                  },
                  child: Text(
                    activeOrder ? "Track your order" : "Reorder items",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
