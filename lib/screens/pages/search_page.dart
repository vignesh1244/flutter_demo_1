import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/search_results.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/sample_data.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/filter_chip.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    return Container(
      padding: EdgeInsets.all(width * 0.02),
      height: height,
      width: width,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onFieldSubmitted: (text) {
                      Get.to(() => SearchResults());
                    },
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: textColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(borderRadius)),
                      hintText: "Search products...",
                      hintStyle: TextStyle(
                        color: textColor.withOpacity(0.5),
                      ),
                      fillColor: textColor.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(
                        FeatherIcons.search,
                        color: textColor.withOpacity(0.5),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FeatherIcons.xOctagon,
                          color: primaryColor,
                        ),
                        tooltip: "Clear",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: height * 0.025),
                  Text(
                    "Trending",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Wrap(
                    runSpacing: height * 0.01,
                    children: [
                      FilterChipButton(
                        title: SampleData().filters[0],
                        enabled: false,
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
                      FilterChipButton(
                        title: SampleData().filters[4],
                        enabled: false,
                        onTap: () {},
                      ),
                      FilterChipButton(
                        title: SampleData().filters[4],
                        enabled: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.025),
                  Text(
                    "Recent searches",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Column(
                    children: getRecentSearchTiles(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getRecentSearchTiles() {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    List<Widget> widgets = [];
    for (int i = 0; i < SampleData().recentSearches.length; i++) {
      widgets.add(
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: height * 0.005),
          onTap: () {
            Get.to(() => SearchResults());
          },
          leading: Icon(
            Icons.history,
            color: textColor.withOpacity(0.7),
          ),
          title: Text(
            SampleData().recentSearches[i],
            style: TextStyle(fontSize: 14.sp, color: textColor),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              FeatherIcons.arrowUpLeft,
              color: textColor.withOpacity(0.7),
            ),
          ),
        ),
      );
    }
    return widgets;
  }
}
