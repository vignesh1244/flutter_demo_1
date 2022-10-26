import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CourierContactCard extends StatelessWidget {
  final String courierName;
  final String phone;
  final String email;

  CourierContactCard({required this.courierName, required this.phone, this.email = ""});

  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    return Container(
      padding: EdgeInsets.all(width * 0.025),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: width * 0.045,
              ),
              SizedBox(width: width * 0.025),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courierName,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Your courier",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: textColor.withOpacity(0.7),
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FeatherIcons.phoneCall,
                  color: primaryColor,
                ),
                tooltip: "Call",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FeatherIcons.mail,
                  color: primaryColor,
                ),
                tooltip: "Message",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
