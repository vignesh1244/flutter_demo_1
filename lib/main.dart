import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/login_register.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child) => MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider())
        ],
        child: Builder(
          builder: (context) => GetMaterialApp(
            color: primaryColor,
            theme: ThemeData(primarySwatch: Colors.red).copyWith(
              scaffoldBackgroundColor:
                  Provider.of<ThemeProvider>(context).scaffoldColor,
              textTheme: GoogleFonts.lexendDecaTextTheme(),
              primaryColor: primaryColor,
            ),
            home: LoginRegister(),
          ),
        ),
      ),
    );
  }
}
