import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';


class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPage();
}

class _DashBoardPage extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
           backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
          title: Text('DashBoard'),
          centerTitle: true,
          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.sort),
            SizedBox(
              width: 20,
            )
          ],
         

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
            labelColor: dark ? SColors.primary : SColors.dark,
            unselectedLabelColor:
                dark ? SColors.lighGrey : SColors.darkContainer,
            indicatorWeight: 4.0,
            isScrollable: true,
          ),
          // elevation: 1,
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
              
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                
              ],
            ),
          ), SingleChildScrollView(
            child: Column(
              children: [
                
              ],
            ),
          )
        ]),
      ),
    );
  }
}
