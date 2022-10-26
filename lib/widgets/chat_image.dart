import 'package:flutter/material.dart';
import 'package:groceryapp/utils/size.dart';

class ChatImage extends StatelessWidget {
  final bool isSender;
  final String imageURL;

  ChatImage({
    this.isSender = true,
    this.imageURL = "",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(width * 0.01),
          margin: EdgeInsets.only(bottom: height * 0.01),
          width: width * 0.25,
          height: width * 0.25,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: imageURL == "" ? SizedBox.shrink() : Image.asset(imageURL)
        ),
      ],
    );
  }
}
