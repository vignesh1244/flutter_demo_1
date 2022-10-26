import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/sample_data.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/category_card.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;

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
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          "All Categories",
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
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(width * 0.02),
                  crossAxisCount: 3,
                  children: getCategoryWidgets(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getCategoryWidgets() {
    List<Widget> widgets = [];
    for (int i = 0; i < SampleData().categories.length; i++) {
      widgets.add(
        CategoryCard(
          SampleData().categories[i]["name"],
          SampleData().categories[i]["image"],
        ),
      );
    }
    return widgets;
  }
}
