import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';
import '../widgets/setting_element_widget.dart';

class SettingsPage extends StatefulWidget {
  static const route = "SettingsPage";
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Setting',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          constraints:
              BoxConstraints(maxWidth: width > 800 ? 800 : width * 0.9),
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SettingElementsWidget(
                  description: 'Frequentlys',
                  icon: Icons.question_mark_outlined,
                  name: 'FAQs',
                  // function: () {
                  //   print("go to faq");
                  // },
                ),
                const SettingElementsWidget(
                  description: 'terms of use,',
                  icon: Icons.format_align_justify,
                  name: 'Term And Condition',
                  // function: () {
                  //   print("go to term and condition");
                  // },
                ),
                const SettingElementsWidget(
                  description: 'description',
                  icon: Icons.info,
                  name: 'About',
                  // function: () {
                  //   print("go to faq");
                  // },
                ),
                const SettingElementsWidget(
                  description: 'a set  ',
                  icon: Icons.palette,
                  name: 'Themes',
                  // function: () {
                  //   print("go to faq");
                  // },
                ),
                const SettingElementsWidget(
                  description: 'retrieving the ',
                  icon: Icons.update,
                  name: 'Check for update',
                  // function: () {
                  //   print("go to faq");
                  // },
                ),
                const SettingElementsWidget(
                  description: 'terminating  ',
                  icon: Icons.logout,
                  name: 'Log out',
                  // function: () {
                  //   print("go to faq");
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
