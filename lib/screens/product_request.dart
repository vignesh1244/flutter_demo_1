import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/product_request_list.dart';
import 'package:provider/provider.dart';

class ProductRequest extends StatefulWidget {
  @override
  _ProductRequestState createState() => _ProductRequestState();
}

class _ProductRequestState extends State<ProductRequest> {
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
                    "Make Product Request",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Can't find your desired items in the shop?",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    InkWell(
                      onTap: () {},
                      highlightColor: primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadius),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                        padding: EdgeInsets.all(width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FeatherIcons.uploadCloud,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Upload image",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: textColor,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                Text(
                                  "Choose image of your shopping list from gallery",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: textColor.withOpacity(0.7),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Text(
                      "Give us a list of products",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Column(
                      children: [
                        ProductRequestList(
                          number: 1,
                          title: "Rice",
                        ),
                        ProductRequestList(
                          number: 2,
                          title: "Eggs",
                        ),
                        ProductRequestList(
                          number: 3,
                          title: "Lentils",
                        ),
                        ProductRequestList(
                          number: 4,
                          title: "Chicken",
                        ),
                        ProductRequestList(
                          number: 5,
                          title: "",
                          showTextField: true,
                        ),
                      ],
                    ),
                    Divider(),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01)),
                      child: Row(
                        children: [
                          Icon(FeatherIcons.plus),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            "Add new item",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
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
                          "Submit",
                          style: TextStyle(
                            color: white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
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
