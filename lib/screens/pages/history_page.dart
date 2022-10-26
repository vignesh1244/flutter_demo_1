import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/home.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/error_message_widget.dart';
import 'package:groceryapp/widgets/order_history_card.dart';
import 'package:groceryapp/widgets/tab_button.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';


bool _noHistory = true;
bool _activeOrders = true;

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
                  onPressed: () {},
                  icon: Icon(
                    FeatherIcons.chevronLeft,
                    color: textColor,
                  ),
                ),
                SizedBox(width: width * 0.02),
                Text(
                  "Order History",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: textColor,
                  ),
                ),
              ],
            ),
            !_noHistory
                ? ErrorMessageWidget(
                    animPath: 'assets/animations/empty-sad-shopping-bag.json',
                    title: "No order history",
                    description:
                        "Buy something to see your order here. Have fun shopping!",
                    actionTitle: "Lets Shop",
                    onTapAction: () {
                      Get.offAll(
                        () => Home(),
                      );
                    },
                  )
                : Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.02),
                          padding: EdgeInsets.all(width * 0.01),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child:
                                    TabButton(_activeOrders, "Active (2)", () {
                                  setState(() {
                                    _activeOrders = true;
                                  });
                                }),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Expanded(
                                child: TabButton(
                                    !_activeOrders, "Past Orders (2)", () {
                                  setState(() {
                                    _activeOrders = false;
                                  });
                                }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Expanded(
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(width * 0.02),
                            children: [
                              OrderHistoryCard(_activeOrders),
                              OrderHistoryCard(_activeOrders)
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
