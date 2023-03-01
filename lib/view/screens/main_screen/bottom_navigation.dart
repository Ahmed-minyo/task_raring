import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../customs/colors.dart';
import '../account/account_screen.dart';
import '../home/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentTab = 0;
  final List<Widget> screens = [
    MyPage(),
    // Container(),
    ProfileScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MyPage(); // Our first view in viewport

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor:AppColors.secondaryColor ,
      //   elevation: 0,
      //   child: SizedBox(),
      //   // Icon(
      //   //   Icons.search,
      //   //   color: Colors.white,
      //   //   size: 30,
      //   // ),
      //   onPressed: () {
      //     setState(() {
      //       currentScreen =
      //           Container(); // if user taps on this dashboard tab will be active
      //       currentTab = 3;
      //     });
      //
      //   },
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomAppBar(
        // color: dark_grey,
        shape: CircularNotchedRectangle(),
        notchMargin: 20,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 36,
                    onPressed: () {
                      setState(() {
                        currentScreen = MyPage();
                        currentTab = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: currentTab == 0
                                ? AppColors.secondaryColor
                                : Colors.grey,
                          ),
                          Text(
                            'Home'.tr,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: currentTab == 0
                                  ? AppColors.secondaryColor
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfileScreen();
                        currentTab = 2;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 45, left: 45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.person_alt_circle,
                            color: currentTab == 2
                                ? AppColors.secondaryColor
                                : Colors.grey,
                          ),
                          Text(
                            "My Account".tr,
                            style: TextStyle(
                              color: currentTab == 2
                                  ? AppColors.secondaryColor
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
