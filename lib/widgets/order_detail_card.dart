import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderDetailCard extends StatelessWidget {
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(FeatherIcons.clock),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "Delivery today at 3:00 pm",
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontSize: 12.sp,
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Change time",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(FeatherIcons.mapPin),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.6,
                    child: Text(
                      "Luminous tower, Flat E2, Sheikh ghat, Sylhet, Hello World",
                      style: TextStyle(
                        color: textColor.withOpacity(0.7),
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Write instructions (optional)",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
