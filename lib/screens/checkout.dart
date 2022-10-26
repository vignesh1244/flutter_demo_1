import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/cart.dart';
import 'package:groceryapp/screens/order_placed.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/address_card.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    var scaffoldColor = Provider.of<ThemeProvider>(context).scaffoldColor;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          "Checkout",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => Cart());
                          },
                          icon: Icon(
                            FeatherIcons.shoppingBag,
                            color: primaryColor,
                          ),
                          tooltip: "Cart",
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            width: width * 0.045,
                            height: width * 0.045,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "4",
                              style: TextStyle(color: white, fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(width * 0.04),
                  children: [
                    Text(
                      "Shipping to",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    AddressCard(title: "Home", address: "Luminous tower, Flat E2, Sheikghat, Shylet", phone: "+1234567890"),
                    AddressCard(title: "Office", address: "Jhorna Complex, Kumarpara, Shylet", phone: "+0987654321"),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            primary: primaryColor,
                          ),
                          child: Row(
                            children: [
                              Icon(FeatherIcons.plus),
                              SizedBox(width: width * 0.01),
                              Text(
                                "Add new address",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "Preferred delivery time",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          highlightColor: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(borderRadius),
                          child: Container(
                            padding: EdgeInsets.all(width * 0.02),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Date",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Text(
                                          "Sat, Jun 10",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                  ],
                                ),
                                Icon(
                                  FeatherIcons.chevronDown,
                                  color: textColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.025),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            highlightColor: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(borderRadius),
                            child: Container(
                              padding: EdgeInsets.all(width * 0.02),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: textColor,
                                            ),
                                          ),
                                          Text(
                                            "9:00 AM - 10:00 AM",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                              color: textColor,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    FeatherIcons.chevronDown,
                                    color: textColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "Payment method",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: 1,
                      onChanged: (x) {},
                      title: Text(
                        "Cash on delivery",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: textColor,
                        ),
                      ),
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: 1,
                      onChanged: (x) {},
                      title: Text(
                        "Credit or Debit Card",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: textColor,
                        ),
                      ),
                    ),
                    RadioListTile(
                      value: 3,
                      groupValue: 1,
                      onChanged: (x) {},
                      title: Text(
                        "Google Pay",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: textColor,
                        ),
                      ),
                    ),
                    RadioListTile(
                      value: 4,
                      groupValue: 1,
                      onChanged: (x) {},
                      title: Text(
                        "PayPal",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(width * 0.04),
                decoration: BoxDecoration(
                  color: scaffoldColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius * 3),
                    topRight: Radius.circular(borderRadius * 3),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(0, -2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total 4 items in cart",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: textColor,
                          ),
                        ),
                        Text(
                          "\$100",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => OrderPlaced());
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.red[900],
                          backgroundColor: primaryColor,
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.015,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                        ),
                        child: Text(
                          "Place order",
                          style: TextStyle(
                            color: white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
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
