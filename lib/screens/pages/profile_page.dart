import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/home.dart';
import 'package:groceryapp/screens/my_cards.dart';
import 'package:groceryapp/screens/pages/home_page.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/profile_detail_tile.dart';
import 'package:groceryapp/widgets/profile_statistic.dart';
import 'package:provider/provider.dart';

import '../login_register.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;

    return Container(
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
                    Get.offAll(() => Home());
                  },
                  icon: Icon(
                    FeatherIcons.chevronLeft,
                    color: textColor,
                  ),
                ),
                SizedBox(width: width * 0.02),
                Text(
                  "User Profile",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor.withOpacity(0.4),
                            radius: width * 0.1,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Tooltip(
                              message: "Change Profile Photo",
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(width),
                                child: Container(
                                  width: width * 0.075,
                                  height: width * 0.075,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    FeatherIcons.camera,
                                    color: white,
                                    size: width * 0.04,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "Aqeel Shamz",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileStatistic(
                        value: "25",
                        label: "Order",
                      ),
                      ProfileStatistic(
                        value: "\$168",
                        label: "Saved",
                      ),
                      ProfileStatistic(
                        value: "\$1760",
                        label: "Spent",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: Column(
                      children: [
                        ProfileDetailTile(
                          title: "Mobile number",
                          value: "+1234567890",
                        ),
                        ProfileDetailTile(
                          title: "Address",
                          value: "Luminous Tower, Flat E2, Sheikghat, Shylet",
                          onTap: () {},
                        ),
                        ProfileDetailTile(

                          title: "Email",
                          prefix: Padding(
                            padding: EdgeInsets.only(
                              right: width * 0.02,
                            ),
                            child: Icon(
                              FeatherIcons.mail,
                              color: textColor,
                            ),
                          ),
                          value: "sample@gmail.com",
                          onTap: () {},
                        ),
                        ProfileDetailTile(
                          prefix: Padding(
                            padding: EdgeInsets.only(
                              right: width * 0.02,
                            ),
                            child: Icon(
                              FeatherIcons.lock,
                              color: textColor,
                            ),
                          ),
                          value: "Change Password",
                          onTap: () {},
                        ),
                        ProfileDetailTile(
                          prefix: Padding(
                            padding: EdgeInsets.only(
                              right: width * 0.02,
                            ),
                            child: Icon(
                              FeatherIcons.creditCard,
                              color: textColor,
                            ),
                          ),
                          value: "Select Default Payment Card",
                          onTap: () {
                            Get.to(() => MyCards());
                          },
                        ),
                        ProfileDetailTile(
                          prefix: Padding(
                            padding: EdgeInsets.only(
                              right: width * 0.02,
                            ),
                            child: Icon(
                              FeatherIcons.bookmark,
                              color: textColor,
                            ),
                          ),
                          value: "Term & conditions",
                          onTap: () {
                            Get.to(() => {});
                          },
                        ),
                        ProfileDetailTile(
                          prefix: Padding(
                            padding: EdgeInsets.only(
                              right: width * 0.02,
                            ),
                            child: Icon(
                              FeatherIcons.logOut,
                              color: textColor,
                            ),
                          ),
                          value: "Logout",
                          onTap: () {
                            Get.to(() =>
                              LoginRegister()
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
