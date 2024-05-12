import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/helper_function.dart';
import '../../widgets/analytics/graph1.dart';

class CompanyAnalytics extends StatelessWidget {
  const CompanyAnalytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text(
            'How Many Company Register',
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
          LineChartgraph(),
          Text(
            'How Many Company Sell Share ',
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
