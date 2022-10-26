import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/sample_data.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/cart_items_fab.dart';
import 'package:groceryapp/widgets/error_message_widget.dart';
import 'package:groceryapp/widgets/filter_chip.dart';
import 'package:groceryapp/widgets/product_list_card.dart';
import 'package:groceryapp/widgets/search_filter.dart';
import 'package:provider/provider.dart';

bool _emptyResult = true;

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CartItemsFAB(4),
      body: Container(
        padding: EdgeInsets.all(width * 0.02),
        height: height,
        width: width,
        child: SafeArea(
          child: Column(
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
                  Expanded(
                    child: TextFormField(
                      autofocus: false,
                      textInputAction: TextInputAction.search,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: textColor,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        fillColor: textColor.withOpacity(0.1),
                        filled: true,
                        prefixIcon: Icon(
                          FeatherIcons.search,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
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
                ],
              ),
              SizedBox(height: height * 0.01),
              !_emptyResult
                  ? ErrorMessageWidget(
                      animPath: 'assets/animations/404-page-not-found.json',
                      title: "No results found",
                      description:
                          "Sorry the products you are looking for doesn't exist or can't be found",
                      actionTitle: "Search Again",
                      onTapAction: () {},
                    )
                  : Expanded(
                      child: Column(
                        children: [
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
                          SizedBox(height: height * 0.01),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.02),
                            child: Row(
                              children: [
                                Text(
                                  "6 ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Products found",
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(left: width * 0.01),
                                  child: ProductListCard(
                                    false,
                                    title: SampleData().sampleProducts[index]
                                        ["title"],
                                    weight: SampleData().sampleProducts[index]
                                        ["weight"],
                                    description: SampleData()
                                        .sampleProducts[index]["description"],
                                    price: SampleData().sampleProducts[index]
                                        ["price"],
                                        images: SampleData().sampleProducts[index]["images"],
                                  ),
                                );
                              },
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