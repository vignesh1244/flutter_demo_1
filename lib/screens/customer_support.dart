import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/widgets/chat_bubble.dart';
import 'package:groceryapp/widgets/chat_image.dart';
import 'package:provider/provider.dart';

class CustomerSupport extends StatefulWidget {
  @override
  _CustomerSupportState createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(width * 0.02),
        height: height,
        width: width,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  Column(
                    children: [
                      Text(
                        "Customer Support",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: textColor,
                        ),
                      ),
                      Text(
                        "Ask any questions. Online 24/7",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: textColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FeatherIcons.phoneCall,
                      color: primaryColor,
                    ),
                    tooltip: "Call",
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Expanded(
                child: ListView(
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    ChatBubble(
                      message: "Hello! How can we help?",
                      isSender: false,
                      time: "8:00 PM",
                    ),
                    ChatBubble(
                      message:
                          "I ordered some groceries. The delivery was not on time, and some products have gone rotten",
                      isSender: true,
                      time: "8:01 PM",
                    ),
                    ChatBubble(
                      message: "We are sorry for the inconvenience.",
                      isSender: false,
                      time: "8:01 PM",
                    ),
                    ChatBubble(
                      message: "Can you upload some product pictures?",
                      isSender: false,
                      time: "8:02 PM",
                    ),
                    ChatBubble(
                      message: "So that we can confirm it",
                      time: "8:02 PM",
                      isSender: false,
                    ),
                    ChatImage(),
                    ChatImage(),
                    ChatBubble(
                      message: "Check the images of the products",
                      time: "8:03 PM",
                      isSender: true,
                    ),
                    ChatBubble(
                      message: "Your complaint has been recieved",
                      time: "8:03 PM",
                      isSender: false,
                    ),
                    ChatBubble(
                      message: "Do you want to make a refund request?",
                      time: "8:04 PM",
                      isSender: false,
                    ),
                    ChatBubble(
                      message: "Yes",
                      time: "8:05 PM",
                      isSender: true,
                    ),
                  ].reversed.toList(),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FeatherIcons.image,
                      color: textColor.withOpacity(0.5),
                    ),
                    tooltip: "Send Image",
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Type something here ...",
                        hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
                        fillColor: textColor.withOpacity(0.1),
                        filled: true,
                      ),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: textColor,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FeatherIcons.send,
                      color: primaryColor,
                    ),
                    tooltip: "Send",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
