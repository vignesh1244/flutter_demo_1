import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/sample_data.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/filter_chip.dart';
import 'package:provider/provider.dart';

class SearchFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    var scaffoldColor = Provider.of<ThemeProvider>(context).scaffoldColor;

    return Container(
      color: scaffoldColor,
      width: width,
      height: height * 0.7,
      padding: EdgeInsets.all(width * 0.02),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  FeatherIcons.x,
                  color: textColor,
                ),
              ),
              Text(
                "Filter",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: textColor,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: primaryColor,
                    ),
                    child: Text(
                      "Reset",
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                InkWell(
                  onTap: () {},
                  highlightColor: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Container(
                    padding: EdgeInsets.all(width * 0.04),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(borderRadius),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sort By",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Popularity",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: textColor,
                              ),
                            ),
                            Icon(
                              FeatherIcons.chevronDown,
                              color: textColor,
                            ),
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
                  "Price Range",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "From",
                          fillColor: textColor.withOpacity(0.1),
                          filled: true,
                          prefixText: "\$ ",
                          prefixStyle: TextStyle(color: textColor),
                          hintStyle: TextStyle(
                            color: textColor.withOpacity(0.5),
                          ),
                        ),
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: textColor.withOpacity(0.1),
                          filled: true,
                          hintText: "To",
                          prefixText: "\$ ",
                          prefixStyle: TextStyle(
                            color: textColor,
                          ),
                          hintStyle: TextStyle(
                            color: textColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Wrap(
                  runSpacing: height * 0.01,
                  children: [
                    FilterChipButton(
                      title: SampleData().categories[0]["name"],
                      enabled: true,
                      onTap: () {},
                    ),
                    FilterChipButton(
                      title: SampleData().categories[1]["name"],
                      enabled: false,
                      onTap: () {},
                    ),
                    FilterChipButton(
                      title: SampleData().categories[2]["name"],
                      enabled: false,
                      onTap: () {},
                    ),
                    FilterChipButton(
                      title: SampleData().categories[3]["name"],
                      enabled: false,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  "Brands",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Wrap(
                  runSpacing: height * 0.01,
                  children: [
                    FilterChipButton(
                      title: SampleData().filters[0],
                      enabled: true,
                      onTap: () {},
                    ),
                    FilterChipButton(
                      title: SampleData().filters[1],
                      enabled: false,
                      onTap: () {},
                    ),
                    FilterChipButton(
                      title: SampleData().filters[2],
                      enabled: false,
                      onTap: () {},
                    ),
                    FilterChipButton(
                      title: SampleData().filters[3],
                      enabled: false,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Get.back();
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
                "Apply Filter",
                style: TextStyle(
                  color: white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
