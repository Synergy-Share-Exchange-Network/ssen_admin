import 'package:flutter/material.dart';
import 'package:ssen_admin/utils/constants/colors.dart';
import 'package:ssen_admin/utils/constants/global_varable.dart';
import 'package:ssen_admin/utils/helper_function.dart';

import '../component/dashboard.dart';
import '../component/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const route = "main_page_state";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  // final screens = [Home(), Subscription(), Favorite(), Cart(), Order()];
  final screens = [
     
    Home(),
    Center(child: Text("3")),
    Center(child: Text("4")),
    Center(child: Text("5")),
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = SHelperFunction.isDarkMode(context);

    return Scaffold(
        // drawer: const CustomDrawer(),
        body: IndexedStack(
          children: screens,
          index: currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: (isDark) ? SColors.homePageNavBar : Colors.white,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => setState(() => currentIndex = index),
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: "Dashboard",
                backgroundColor: SColors.primary,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: "User",
                // backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.factory),
                label: "Company",
                // backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.request_page),
                label: "Request",
                // backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.admin_panel_settings),
                label: "Admin",
                // backgroundColor: Colors.blue
              ),
            ]));
  }
}
