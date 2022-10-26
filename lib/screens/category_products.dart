import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/sample_data.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/cart_items_fab.dart';
import 'package:groceryapp/widgets/filter_chip.dart';
import 'package:groceryapp/widgets/product_list_card.dart';
import 'package:groceryapp/widgets/search_filter.dart';
import 'package:provider/provider.dart';

class CategoryProducts extends StatefulWidget {
  final String categoryName;
  CategoryProducts(this.categoryName);

  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
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
                          widget.categoryName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SearchFilter();
                              },
                            );
                          },
                          icon: Icon(
                            FeatherIcons.filter,
                            color: primaryColor,
                          ),
                          tooltip: "Search Filter",
                        ),
                        SizedBox(
                          width: width * 0.02,
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
                child: ListView.builder(
                  padding:
                      EdgeInsets.only(top: width * 0.02, left: width * 0.04),
                  physics: BouncingScrollPhysics(),
                  itemCount: SampleData().sampleProducts.length,
                  itemBuilder: (context, index) {
                    return ProductListCard(
                      false,
                      title: SampleData().sampleProducts[index]["title"],
                      weight: SampleData().sampleProducts[index]["weight"],
                      description: SampleData().sampleProducts[index]
                          ["description"],
                      price: SampleData().sampleProducts[index]["price"],
                      images: SampleData().sampleProducts[index]["images"],
                    );
                  },
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
}
