import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screen_Second/home_page.dart';
import 'package:groceryapp/screens/home.dart';
import 'package:groceryapp/screens/otp_verification.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:groceryapp/utils/masked_text_input.dart';
import 'package:groceryapp/utils/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    Provider.of<ThemeProvider>(context, listen: false).loadTheme();
    super.initState();
  }

  ///////////////////////////////////////////////////////////////////
  TextEditingController mobileController = TextEditingController();

  Future<void> login(mobile) async {
    if (mobileController.text.isNotEmpty) {
      var respose = await http.post(
          Uri.parse("https://manage.rinzyee.com/api-login"),
          body: {'mobile': mobileController.text});

      print(respose.statusCode);
      if (respose.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScrenn(),
            ));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Credential')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Balack fild not allowd')));
    }
  }
/////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(width * 0.04),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor.withOpacity(0.3),
              primaryColor.withOpacity(0.1),
              primaryColor.withOpacity(0),
              primaryColor.withOpacity(0),
              primaryColor.withOpacity(0.1),
              primaryColor.withOpacity(0.3),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        width: width,
        height: height,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter mobile number",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: textColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    "for ",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: textColor,
                    ),
                  ),
                  Text(
                    "Login / Registration",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                "Mobile Number",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: textColor,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.15,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        MaskedTextInputFormatter(
                          mask: 'xxx',
                          separator: '-',
                        ),
                      ],
                      autofocus: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: textColor.withOpacity(0.1),
                        filled: true,
                      ),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Expanded(
                    child: TextField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        MaskedTextInputFormatter(
                          mask: 'xxxxxxxxxx',
                          separator: '',
                        ),
                      ],
                      decoration: InputDecoration(
                        fillColor: textColor.withOpacity(0.1),
                        filled: true,
                      ),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => OTPVerification());
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.red[900],
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.015,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  child: Text(
                    "Get OTP",
                    style: TextStyle(
                      color: white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SignInButton(
                      Buttons.Google,
                      padding: EdgeInsets.all(width * 0.01),
                      onPressed: () {
                        // Get.offAll(() => Home());
                        login(mobileController.text.toString());
                      },
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                        onSurface: Colors.red,
                      ),
                      onPressed: () { login(mobileController.text.toString());},
                      child: Text('Sign in with Mobile'),
                    )
                    // SizedBox(
                    //   height: height * 0.005,
                    // ),
                    // SignInButton(
                    //   Buttons.FacebookNew,
                    //   padding: EdgeInsets.all(width * 0.01),
                    //   onPressed: () {
                    //     Get.offAll(() => Home());
                    //   },
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
