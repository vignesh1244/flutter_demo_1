import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/checkout.dart';
import 'package:groceryapp/screens/coupons.dart';
import 'package:groceryapp/screens/home.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/sample_data.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/cart_product_list_card.dart';
import 'package:groceryapp/widgets/error_message_widget.dart';
import 'package:provider/provider.dart';

bool _emptyCart = true;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
                          "Cart",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "4 items",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              !_emptyCart
                  ? ErrorMessageWidget(
                      animPath: 'assets/animations/shopping-bag-error.json',
                      title: "Empty Cart",
                      description:
                          "Looks like you haven't added any items yet.",
                      actionTitle: "Lets Shop",
                      onTapAction: () {
                        Get.offAll(() => Home());
                      },
                    )
                  : Expanded(
                      child: ListView(
                        padding: EdgeInsets.all(width * 0.02),
                        physics: BouncingScrollPhysics(),
                        children: getCartProductListCards(),
                      ),
                    ),
              !_emptyCart
                  ? SizedBox.shrink()
                  : Container(
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
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.to(() => Coupons());
                                },
                                style: TextButton.styleFrom(
                                  primary: primaryColor,
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.card_giftcard),
                                    SizedBox(width: width * 0.01),
                                    Text(
                                      "Apply discount code",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                "\$75",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipping fee",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                "\$25",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.005),
                          Divider(),
                          SizedBox(height: height * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
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
                                Get.to(() => CheckOut());
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.red[900],
                                backgroundColor: primaryColor,
                                padding: EdgeInsets.symmetric(
                                  vertical: height * 0.015,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(borderRadius),
                                ),
                              ),
                              child: Text(
                                "Proceed to checkout",
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

  List<Widget> getCartProductListCards() {
    List<Widget> widgets = [];
    for (int i = 1; i <= 4; i++) {
      widgets.add(
        CartProductListCard(
          title: SampleData().sampleProducts[i]["title"],
          weight: SampleData().sampleProducts[i]["weight"],
          price: SampleData().sampleProducts[i]["price"],
          quantity: 3,
          image: SampleData().sampleProducts[i]["images"][0],
          onDismissed: (dismissDirection) {},
        ),
      );
    }
    return widgets;
  }
}
