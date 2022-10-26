import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/home.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/error_message_widget.dart';
import 'package:provider/provider.dart';

class CancelOrder extends StatefulWidget {
  @override
  _CancelOrderState createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
  @override
  Widget build(BuildContext context) {
    // var textColor = Provider.of<ThemeProvider>(context).textColor;
       var textColor = Provider.of<ThemeProvider>(context).textColor;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(width * 0.02),
        height: height,
        width: width,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Cancel Order",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ErrorMessageWidget(
                      animPath: "assets/animations/order-delivery-to-home.json",
                      title: "Order Cancellation",
                      description:
                          "Are you sure want to send a cancellation request?",
                      actionTitle: "Cancel Order",
                      onTapAction: () {
                        Get.offAll(() => Home());
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
