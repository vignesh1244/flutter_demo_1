import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/sample_data.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:groceryapp/widgets/category_card.dart';
import 'package:groceryapp/widgets/bundle_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/product_list_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: width * 0.02, top: width * 0.02),
        height: height,
        width: width,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Builder(
                        builder: (context) => IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(
                            FeatherIcons.menu,
                            color: textColor,
                          ),
                          tooltip: "Menu",
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Deliver to",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: textColor,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Luminous tower, Sheikhghat, Sylhet",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: textColor,
                                ),
                              ),
                              Icon(
                                FeatherIcons.chevronDown,
                                color: textColor,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.02),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FeatherIcons.search,
                        color: textColor,
                      ),
                      tooltip: "Search",
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Get your ",
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                "groceries",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  color: textColor,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "delivered quickly",
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.15,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(9.0),
                        itemCount: SampleData().categories.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                              SampleData().categories[index]["name"],
                              SampleData().categories[index]["image"]);
                        },
                      ),
                    ),

                    // padding:
                    //     EdgeInsets.only(left: width * 0.02, top: width * 0.02),
                    // child:
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bundle Offers",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                              TextButton(
                                style:
                                    TextButton.styleFrom(primary: primaryColor),
                                onPressed: () {},
                                child: Text(
                                  "View All",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   height: height * 0.34,
                        //   child: ListView.builder(
                        //     physics: BouncingScrollPhysics(),
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: SampleData().bundles.length,
                        //     itemBuilder: (context, index) {
                        //       return BundleCard(
                        //         title: SampleData().bundles[index]["title"],
                        //         subtitle: SampleData().bundles[index]
                        //             ["subtitle"],
                        //         price: SampleData().bundles[index]["price"],
                        //         image: SampleData().bundles[index]["image"],
                        //         onTap: () {},
                        //       );
                        //     },
                        //   ),
                        // ),
                        /////////////////////////////////////////////////////////////////
                        Container(
                          height: height * 0.34,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: SampleData().bundles.length,
                            itemBuilder: (context, index) {
                              return BundleCard(
                                title: SampleData().bundles[index]["title"],
                                subtitle: SampleData().bundles[index]
                                    ["subtitle"],
                                price: SampleData().bundles[index]["price"],
                                image: SampleData().bundles[index]["image"],
                                description: SampleData().bundles[index]["description"],
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                        /////////////////////////////////////////////////////////////////
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.02),
                              child: TextButton(
                                style:
                                    TextButton.styleFrom(primary: primaryColor),
                                onPressed: () {},
                                child: Text(
                                  "View All",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: height*height*0.02,
                            // height: height*0.6,

                            child: GridView.builder(
                              // physics: new NeverScrollableScrollPhysics(),
                              // physics: ClampingScrollPhysics(),
                              physics: NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(9.0),

                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,

                                      // childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 7,
                                      mainAxisSpacing: 2),
                              itemCount: SampleData().sampleProducts.length,
                              itemBuilder: (context, index) {
                                return ProductListCard(
                                  true,
                                  title: SampleData().sampleProducts[index]
                                      ["title"],
                                  weight: SampleData().sampleProducts[index]
                                      ["weight"],
                                  description: SampleData()
                                      .sampleProducts[index]["description"],
                                  price: SampleData().sampleProducts[index]
                                      ["price"],
                                  images: SampleData().sampleProducts[index]
                                      ["images"],
                                );
                              },
                            ),
                          ),
                        ),

                        // Column(
                        //   children: getProductListCards(),
                        // ),

                      ],
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

  List<Widget> getProductListCards() {
    List<Widget> widgets = [];
    for (int i = 0; i < SampleData().sampleProducts.length; i++) {
      widgets.add(
        ProductListCard(
          true,
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
