import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/cart.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/sample_data.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/small_product_card.dart';
import 'package:groceryapp/widgets/small_square_button.dart';
import 'package:provider/provider.dart';

int _currentImageIndex = 0;

class ProductDetails extends StatefulWidget {
  final String title;
  final String weight;
  final String price;
  final String description;
  final List<String> images;

  ProductDetails(
      {required this.title,
      required this.weight,
      required this.price,
      required this.description,
      required this.images});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    _currentImageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    var scaffoldColor = Provider.of<ThemeProvider>(context).scaffoldColor;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Container(
                height: height * 0.4,
                child: CarouselSlider(
                    items: widget.images
                        .map((e) => CachedNetworkImage(
                              imageUrl: e,
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.images.asMap().entries.map((entry) {
                  return Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _currentImageIndex == entry.key
                            ? primaryColor
                            : Colors.grey),
                  );
                }).toList(),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(width * 0.04),
                  decoration: BoxDecoration(
                    color: scaffoldColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderRadius * 2),
                      topRight: Radius.circular(borderRadius * 2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.6,
                                      child: Text(
                                        widget.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold,
                                            color: textColor),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Qty: ",
                                          style: TextStyle(
                                            color: textColor.withOpacity(0.7),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        Text(
                                          widget.weight,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.price,
                                      style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        SmallSquareButton(
                                            FeatherIcons.minus, () {}),
                                        SizedBox(width: width * 0.015),
                                        Text(
                                          "3",
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: width * 0.015),
                                        SmallSquareButton(
                                            FeatherIcons.plus, () {}),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: textColor),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              widget.description,
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 12.sp,
                                color: textColor.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Text(
                              "Related Products",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Container(
                              height: height * 0.15,
                              child: ListView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: getRelatedProductsWidgets(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                        child: SizedBox(
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
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                              ),
                            ),
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getRelatedProductsWidgets() {
    List<Widget> widgets = [];
    for (int i = 1; i <= 5; i++) {
      widgets.add(SmallProductCard(image: SampleData().sampleProducts[0]["images"][0], title: "Oats meal"));
    }
    return widgets;
  }
}
