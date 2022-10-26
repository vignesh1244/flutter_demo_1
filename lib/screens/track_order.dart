import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/cancel_order.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/courier_contact_card.dart';
import 'package:groceryapp/widgets/order_detail_card.dart';
import 'package:groceryapp/widgets/track_order_route_line.dart';
import 'package:groceryapp/widgets/track_order_route_spot.dart';
import 'package:provider/provider.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
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
                    "Track Order",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(width * 0.02),
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    OrderDetailCard(),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    CourierContactCard(courierName: "John Doe", phone: "+12987654356",),
                    SizedBox(
                      height: height * 0.02,
                    ),
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
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              "Amount: \$55",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => CancelOrder());
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(width * 0.02),
                            side: BorderSide(
                              color: primaryColor,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                          child: Text(
                            "Cancel order",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "ETA: 15 minutes",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TrackOrderRouteSpot(
                      true,
                      "Order placed",
                      "2:30 PM, 27 Aug 2021",
                    ),
                    TrackOrderRouteLine(true),
                    TrackOrderRouteSpot(
                      true,
                      "Items processed",
                      "Bagged in warehouse at 2:40 PM",
                    ),
                    TrackOrderRouteLine(true),
                    TrackOrderRouteSpot(
                      true,
                      "Delivering",
                      "You courier is on the way",
                    ),
                    TrackOrderRouteLine(false),
                    TrackOrderRouteSpot(
                      false,
                      "Shopping delivered",
                      "Expected at 3:05 PM, 27 Aug 2021",
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
