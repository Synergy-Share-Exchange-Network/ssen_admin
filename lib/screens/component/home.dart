import 'package:flutter/material.dart';
import 'package:ssen_admin/screens/component/share_analytics.dart';
import 'package:ssen_admin/screens/component/user_analytics.dart';

import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';
import 'company_analytics.dart';

class Home extends StatefulWidget {
  static const route = "Home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const NavBar(),
        appBar: (MediaQuery.of(context).size.width > phoneSize)
            ? AppBar(
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: TabBar(
                    tabs: const [
                      Tab(
                        text: "User",
                      ),
                      Tab(
                        text: "Company",
                      ),
                      Tab(
                        text: "Share",
                      ),
                    ],
                    labelColor: (!dark) ? SColors.primaryColor : SColors.white,
                    unselectedLabelColor:
                        (!dark) ? SColors.black : SColors.lighGrey,
                    indicatorWeight: 4.0,
                    isScrollable: true,
                  ),
                ),
              )
            : AppBar(
                actions: const [
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.search),
                  SizedBox(
                    width: 20,
                  )
                ],
                backgroundColor:
                    (!dark) ? SColors.lightContainer : SColors.darkContainer,

                bottom: TabBar(
                    tabs: const [
                      Tab(
                        text: "User",
                      ),
                      Tab(
                        text: "Company",
                      ),
                      Tab(
                        text: "Share",
                      ),
                    ],
                    labelColor: (!dark) ? SColors.primaryColor : SColors.white,
                    unselectedLabelColor:
                        (!dark) ? SColors.black : SColors.lighGrey,
                    indicatorWeight: 4.0,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(horizontal: 35.0)),
                // elevation: 1,
              ),
        body: (TabBarView(children: [
          UserAnalytics(),
          CompanyAnalytics(),
          ShareAnalytics(),
        ])),
      ),
    );
  }
}
