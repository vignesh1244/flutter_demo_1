import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/sample_data.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/order_detail_card.dart';
import 'package:groceryapp/widgets/order_summary_card.dart';
import 'package:groceryapp/widgets/product_list_card_mini.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatefulWidget {
  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
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
                    "Order Summary",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(width * 0.02),
                  children: [
                    OrderSummaryCard(),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Container(
                      padding: EdgeInsets.all(width * 0.03),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Items",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11.sp,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FeatherIcons.edit2,
                                  color: textColor,
                                ),
                                tooltip: "Edit",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Column(
                            children: getMiniProductListCards(),
                          ),
                          Divider(),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11.sp,
                                ),
                              ),
                              Text(
                                "\$60",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11.sp,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery fee",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11.sp,
                                ),
                              ),
                              Text(
                                "\$7",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11.sp,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11.sp,
                                ),
                              ),
                              Text(
                                "-\$12",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11.sp,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11.sp,
                                ),
                              ),
                              Text(
                                "\$55",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    OrderDetailCard(),
                    SizedBox(
                      height: height * 0.015,
                    ),
                  ],
                ),
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
                    "Reorder",
                    style: TextStyle(
                      color: white,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getMiniProductListCards() {
    List<Widget> widgets = [];
    for (int i = 1; i <= 4; i++) {
      widgets.add(
        ProductListCardMini(
          title: SampleData().sampleProducts[i]["title"],
          weight: SampleData().sampleProducts[i]["weight"],
          description: SampleData().sampleProducts[i]["description"],
          price: SampleData().sampleProducts[i]["price"],
          images: SampleData().sampleProducts[i]["images"],
        ),
      );
    }
    return widgets;
  }
}
