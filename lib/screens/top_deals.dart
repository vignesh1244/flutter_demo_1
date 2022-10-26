import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/sample_data.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/cart_items_fab.dart';
import 'package:groceryapp/widgets/filter_chip.dart';
import 'package:groceryapp/widgets/bundle_card.dart';
import 'package:groceryapp/widgets/product_list_card.dart';
import 'package:provider/provider.dart';

class TopDeals extends StatefulWidget {
  @override
  _TopDealsState createState() => _TopDealsState();
}

class _TopDealsState extends State<TopDeals> {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CartItemsFAB(4),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
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
                          "Top Deals",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FeatherIcons.search,
                        color: textColor,
                      ),
                      tooltip: "Search",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: width * 0.02,
                  left: width * 0.02,
                  bottom: width * 0.02,
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: getFilterChipWidgets(),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.04, top: width * 0.02),
                      child: Text(
                        "Bundles",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: width * 0.02),
                      height: height * 0.3,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: SampleData().bundles.length,
                        itemBuilder: (context, index) {
                          return BundleCard(
                            title: SampleData().bundles[index]["title"],
                            subtitle: SampleData().bundles[index]["subtitle"],
                            price: SampleData().bundles[index]["price"],
                            image: SampleData().bundles[index]["image"],
                            description: SampleData().bundles[index]["description"],
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.04, top: width * 0.02),
                      child: Text(
                        "Products",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: width * 0.02, left: width * 0.04),
                      child: Column(
                        children: getProductListCardWidgets(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getFilterChipWidgets() {
    List<Widget> widgets = [];
    for (int i = 0; i < SampleData().filters.length; i++) {
      widgets.add(
        FilterChipButton(
          title: SampleData().filters[i],
          enabled: i == 0,
          onTap: () {},
        ),
      );
    }
    return widgets;
  }

  List<Widget> getProductListCardWidgets() {
    List<Widget> widgets = [];
    for (int i = 0; i < SampleData().sampleProducts.length; i++) {
      widgets.add(
        ProductListCard(
          false,
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
