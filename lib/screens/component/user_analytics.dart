import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/helper_function.dart';
import '../../widgets/analytics/graph1.dart';

class UserAnalytics extends StatelessWidget {
  const UserAnalytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
    body: SingleChildScrollView(child: Column(
      children: [
        Text(
          'How Many User Register',
          style: dark
              ? STextTheme.darkTextTheme.headlineSmall
              : STextTheme.lightTextTheme.headlineSmall,
        ),
        LineChartgraph(),
         Text(
          'How Many Share Purchase ',
          style: dark
              ? STextTheme.darkTextTheme.headlineSmall
              : STextTheme.lightTextTheme.headlineSmall,
        ),
         LineChartgraph(),
      ],
    )),

    );
    
  }
}