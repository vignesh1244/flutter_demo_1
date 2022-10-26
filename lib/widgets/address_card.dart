import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String address;
  final String phone;

  AddressCard({required this.title, required this.address, required this.phone});
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    var scaffoldColor = Provider.of<ThemeProvider>(context).scaffoldColor;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.03,
        horizontal: width * 0.02,
      ),
      margin: EdgeInsets.only(bottom: height * 0.015),
      decoration: BoxDecoration(
        color: scaffoldColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 12,
          ),
        ],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Radio(
                value: 1,
                groupValue: 1,
                onChanged: (x) {},
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: width * 0.6,
                    height: height * 0.05,
                    child: Text(
                      address,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: textColor,
                      ),
                    ),
                  ),
                  Text(
                    phone,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: textColor,
                    ),
                  )
                ],
              ),
            ],
          ),
          Material(
            color: scaffoldColor,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.edit2,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
