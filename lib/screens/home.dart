import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:groceryapp/providers/theme_provider.dart';
import 'package:groceryapp/screens/cart.dart';
import 'package:groceryapp/screens/pages/history_page.dart';
import 'package:groceryapp/screens/pages/home_page.dart';
import 'package:groceryapp/screens/pages/search_page.dart';
import 'package:groceryapp/widgets/drawer.dart';
import 'package:groceryapp/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'pages/profile_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var textColor = Provider.of<ThemeProvider>(context).textColor;
    return Scaffold(
      drawer: MenuDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Cart",
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(() => Cart());
        },
        child: Icon(FeatherIcons.shoppingBag),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black,
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: Provider.of<ThemeProvider>(context).scaffoldColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10.sp,
          ),
          unselectedItemColor: textColor,
          currentIndex: _currentPageIndex,
          elevation: 0,
          selectedItemColor: primaryColor,
          onTap: (int index) {
            _pageController.jumpToPage(index);
            // _pageController.animateToPage(
            //   index,
            //   duration: Duration(milliseconds: 200),
            //   curve: Curves.easeInOut,
            // );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.history),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
    );
  }

  int _currentPageIndex = 0;

  PageController _pageController = new PageController();

  List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    HistoryPage(),
    ProfilePage()
  ];
}
