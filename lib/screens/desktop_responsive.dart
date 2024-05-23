import 'package:flutter/material.dart';
import 'package:ssen_admin/screens/about_us.dart';
import 'package:ssen_admin/screens/partial%20screen/company_desktop.dart';
import 'package:ssen_admin/screens/partial%20screen/home_desktop.dart';
import 'package:ssen_admin/screens/partial%20screen/request_desktop.dart';
import 'package:ssen_admin/screens/partial%20screen/user_desktop.dart';
import 'package:ssen_admin/screens/profile.dart';
import 'package:ssen_admin/screens/setting.dart';
import 'package:ssen_admin/screens/term_condition.dart';
import 'package:ssen_admin/utils/constants.dart';
import 'package:ssen_admin/utils/constants/colors.dart';
import 'package:ssen_admin/utils/constants/image_Strings.dart';
import 'package:ssen_admin/utils/helper_function.dart';

import 'component/company.dart';
import 'component/home.dart';
import 'component/request.dart';
import 'component/user.dart';

class DesktopResponsive extends StatefulWidget {
  const DesktopResponsive({super.key});

  @override
  State<DesktopResponsive> createState() => _DesktopResponsiveState();
}

class _DesktopResponsiveState extends State<DesktopResponsive> {
  int index = 0;
  bool drawer = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > tabletSize)
            Visibility(
              visible: drawer,
              child: Container(
                // margin: const EdgeInsets.all(15),
                child: Drawer(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 10),
                          // const Align(
                          //     alignment: Alignment.centerLeft,
                          //     child: Text(
                          //       "Wubet Ayalew",
                          //       style: TextStyle(fontWeight: FontWeight.bold),
                          //     )),
                          Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  index = 5;
                                });
                              },
                              child: Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.blue, width: 3),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(SImages.employee2))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 5;
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Wubet ayalew',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("wubetayalew@gmail.com")
                                  ],
                                )),
                          ),
                          const Divider(),
                          index != 0
                              ? DrawerItem(
                                  icon: Icons.dashboard,
                                  title: "Dashboard",
                                  callback: () {
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.dashboard,
                                  title: "Dashboard",
                                  callback: () {
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                ),
                          index != 1
                              ? DrawerItem(
                                  icon: Icons.admin_panel_settings,
                                  title: "User",
                                  callback: () {
                                    setState(() {
                                      index = 1;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.admin_panel_settings,
                                  title: "User",
                                  callback: () {
                                    setState(() {
                                      index = 1;
                                    });
                                  },
                                ),
                          index != 2
                              ? DrawerItem(
                                  icon: Icons.factory,
                                  title: "Company",
                                  callback: () {
                                    setState(() {
                                      index = 2;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.factory,
                                  title: "Company",
                                  callback: () {
                                    setState(() {
                                      index = 2;
                                    });
                                  },
                                ),
                          index != 3
                              ? DrawerItem(
                                  icon: Icons.request_page,
                                  title: "Request",
                                  callback: () {
                                    setState(() {
                                      index = 3;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.request_page,
                                  title: "Request",
                                  callback: () {
                                    setState(() {
                                      index = 3;
                                    });
                                  },
                                ),
                          index != 4
                              ? DrawerItem(
                                  icon: Icons.admin_panel_settings,
                                  title: "Admin",
                                  callback: () {
                                    setState(() {
                                      index = 4;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.admin_panel_settings,
                                  title: "Admin",
                                  callback: () {
                                    setState(() {
                                      index = 4;
                                    });
                                  },
                                ),
                          const Divider(),
                          index != 5
                              ? DrawerItem(
                                  icon: Icons.person,
                                  title: "Edit Admin",
                                  callback: () {
                                    setState(() {
                                      index = 5;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.person,
                                  title: "Edit Admin",
                                  callback: () {
                                    setState(() {
                                      index = 5;
                                    });
                                  },
                                ),
                          // index != 6
                          //     ? DrawerItem(
                          //         icon: Icons.location_on,
                          //         title: "My Address",
                          //         callback: () {
                          //           setState(() {
                          //             index = 6;
                          //           });
                          //         },
                          //       )
                          //     : SelectedDrawerItem(
                          //         icon: Icons.location_on,
                          //         title: "My Address",
                          //         callback: () {
                          //           setState(() {
                          //             index = 6;
                          //           });
                          //         },
                          //       ),
                          index != 7
                              ? DrawerItem(
                                  icon: Icons.info,
                                  title: "About Us",
                                  callback: () {
                                    setState(() {
                                      index = 7;
                                    });
                                    Navigator.pushNamed(
                                        context, AboutUsPage.route);
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.info,
                                  title: "About Us",
                                  callback: () {
                                    setState(() {
                                      index = 7;
                                    });
                                    Navigator.pushNamed(
                                        context, AboutUsPage.route);
                                  },
                                ),
                          index != 8
                              ? DrawerItem(
                                  icon: Icons.logout,
                                  title: "Log Out",
                                  callback: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Log out"),
                                        content: const Text(
                                            "Are You sure you want to log out?"),
                                        actions: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Container(
                                                  // color: Colors.green,
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: const Text("Cancel"),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  // FirebaseAuth.instance
                                                  //     .signOut();
                                                  // Navigator
                                                  //     .pushReplacementNamed(
                                                  //         context,
                                                  //         Login.route);
                                                },
                                                child: Container(
                                                  // color: Colors.green,
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: const Text("Okay"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.logout,
                                  title: "Log Out",
                                  callback: () {},
                                ),
                          index != 9
                              ? DrawerItem(
                                  icon: Icons.exit_to_app,
                                  title: "Exit",
                                  callback: () {
                                    setState(() {
                                      index = 9;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.exit_to_app,
                                  title: "Exit",
                                  callback: () {
                                    setState(() {
                                      index = 9;
                                    });
                                  },
                                ),
                          const Divider(),
                          index != 10
                              ? DrawerItem(
                                  icon: Icons.settings,
                                  title: "Settings",
                                  callback: () {
                                    Navigator.pushNamed(
                                        context, SettingsPage.route);
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.settings,
                                  title: "Settings",
                                  callback: () {
                                    Navigator.pushNamed(
                                        context, SettingsPage.route);
                                  },
                                ),
                          index != 11
                              ? DrawerItem(
                                  icon: Icons.format_align_center,
                                  title: "Terms and Condition",
                                  callback: () {
                                    setState(() {
                                      index = 11;
                                    });
                                    Navigator.pushNamed(
                                        context, TermsAndConditionsPage.route);
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.format_align_center,
                                  title: "Terms and Condition",
                                  callback: () {
                                    setState(() {
                                      index = 11;
                                    });
                                    Navigator.pushNamed(
                                        context, TermsAndConditionsPage.route);
                                  },
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (MediaQuery.of(context).size.width > tabletSize) {
                          setState(() {
                            if (drawer) {
                              drawer = false;
                            } else {
                              drawer = true;
                            }
                          });
                        }
                        if (MediaQuery.of(context).size.width < tabletSize) {
                          _scaffoldKey.currentState?.openDrawer();
                        }
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.blue,
                        // size: 50,
                      ),
                    ),
                    const Text(
                      'Synergy Stock Exchange',
                      style: TextStyle(
                          // fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.none),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(SImages.lightAppLogo))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: SizedBox()),
                      (MediaQuery.of(context).size.width > phoneSize)
                          ? Container(
                              width: (drawer)
                                  ? 690
                                  : MediaQuery.of(context).size.width - 225,
                              height: MediaQuery.of(context).size.height,
                              child: IndexedStack(
                                index: index,
                                children: [
                                  // const DashboardDesktop(),
                                  // const UserDesktop(),
                                  // const CompanyDesktop(),
                                  // const RequestDesktop(),
                                  // const OrderDesktop(),
                                  // const AdminPageState(),
                                  // Location()

                                  Home(),
                                  User(),
                                  Company(),
                                  RequestPage(),
                                  ProfilePage(),
                                  Text('1'),

                                  Text('1'),
                                  Text('1'),
                                  Text('1'),
                                ],
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: IndexedStack(
                                index: index,
                                children: [
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                ],
                              ),
                            ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: Card(
                                elevation: 2,
                                child: Container(
                                  width: 200,
                                  height: 300,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.all(15),
                                            child: const Text(
                                              "Explore",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blue),
                                            )),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            children: [
                                              const ExploreElement(
                                                icon: Icons.trending_up,
                                                title: "Trending Product ",
                                              ),
                                              const ExploreElement(
                                                icon: Icons.sports_baseball,
                                                title: "Sport Product",
                                              ),
                                              const ExploreElement(
                                                icon: Icons.construction,
                                                title: "Constraction",
                                              ),
                                              const ExploreElement(
                                                icon: Icons.smartphone_sharp,
                                                title: "Smart Phone",
                                              ),
                                              const ExploreElement(
                                                icon: Icons.laptop,
                                                title: "Laptop",
                                              ),
                                              const ExploreElement(
                                                icon: Icons
                                                    .account_balance_rounded,
                                                title: "House",
                                              ),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: const Text('See More'))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreElement extends StatelessWidget {
  const ExploreElement({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(title)
        ],
      ),
    );
  }
}

class UserChannel extends StatelessWidget {
  const UserChannel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                shape: BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(SImages.lightAppLogo))),
          ),
          // const Expanded(flex: 1, child: SizedBox()),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 150,
            child: Text(
              "Abebe shop jk",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserChannelSmall extends StatelessWidget {
  const UserChannelSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                shape: BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(SImages.lightAppLogo))),
          ),
          // const Expanded(flex: 1, child: SizedBox()),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 100,
            child: Text(
              "Abebe shop jk",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.callback,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return InkWell(
      onTap: callback,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(icon, color: (dark) ? SColors.grey : SColors.darkeGery),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 12,
                    color: (dark) ? SColors.lighGrey : SColors.darkerGery,
                    fontWeight: FontWeight.bold),
                // style: STextTheme.darkTextTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class SelectedDrawerItem extends StatelessWidget {
  const SelectedDrawerItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.callback,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        // decoration: BoxDecoration(
        //     color: Colors.blue.shade50,
        //     borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(icon, color: Colors.blue),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),

                    // VerticalDivider(
                    //   width: 10,
                    //   color: Colors.blue,
                    // )
                  ],
                ),
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class SubscribedChannelSmall extends StatelessWidget {
  const SubscribedChannelSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                shape: BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(SImages.lightAppLogo))),
          ),
          // const Expanded(flex: 1, child: SizedBox()),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 100,
            child: Text(
              "Abebe shop jk",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
