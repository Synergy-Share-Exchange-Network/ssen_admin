import 'package:flutter/material.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';
import '../../widgets/request_widget.dart';
import '../request_detail.dart';
import '../request_history.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              dark ? SColors.darkContainer : SColors.lightContainer,
          elevation: 0,
          title: Text(
            'Request',
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
          centerTitle: true,
          bottom: TabBar(
              labelColor: dark ? SColors.white : SColors.black,
              tabs: const [
                Tab(
                  child: Text(
                    "Regstration",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
                Tab(
                  child: Text(
                    "Others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
                Tab(
                  child: Text(
                    "Histor",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
              ]),
        ),
        body: (TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [RequestWidget()],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [RequestWidget()],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [RequestHistory()],
            ),
          ),
        ])),
      ),
    );
  }
}
