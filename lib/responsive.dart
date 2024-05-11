import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_admin/screens/desktop_responsive.dart';
import 'package:ssen_admin/screens/state_pages/main_page.dart';
import 'package:ssen_admin/utils/constants.dart';


class Responsive extends StatefulWidget {
  const Responsive({Key? key}) : super(key: key);

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (MediaQuery.of(context).size.width > phoneSize)
          ? const DesktopResponsive()
          : const MainPage(),
    );
  }
}
