import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';
import '../../widgets/company_profile_widget.dart';
import '../../widgets/user_profile_widget.dart';

class Company extends StatelessWidget {
  static const route = "Company";
  const Company({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      drawer: (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
      appBar: (MediaQuery.of(context).size.width > phoneSize)
          ? null
          : AppBar(
              centerTitle: true,
              title: Text(
                'Company ',
                style: dark
                    ? STextTheme.darkTextTheme.headlineSmall
                    : STextTheme.lightTextTheme.headlineSmall,
              ),

              backgroundColor:
                  dark ? SColors.darkContainer : SColors.lightContainer,

              // elevation: 1,
            ),
      body: SingleChildScrollView(
          child: Column(
        children: [CompanyWidget()],
      )),
    );
  }
}
