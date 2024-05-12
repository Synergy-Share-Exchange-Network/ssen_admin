import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ssen_admin/firebase_options.dart';
import 'package:ssen_admin/intermediate.dart';
import 'package:ssen_admin/responsive.dart';
import 'package:ssen_admin/screens/company_detail.dart';
import 'package:ssen_admin/screens/state_pages/main_page.dart';
import 'package:ssen_admin/screens/user_detail.dart';
import 'package:ssen_admin/services/app_routes.dart';
import 'package:ssen_admin/services/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synergy Share Exchange Network',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SappTheme.lightTheme,
      darkTheme: SappTheme.darkTheme,

      // home: const About(),
      // home: const Announcment(),
      // home: EnterNewPassword(),
      // home: Intermediate(),

      // home: const TermAndCondition(),
      // home: MainPage(),

      // home: SignUp(),

      // home: HomePage(),
      // home: Companyprofile(),
      // home: Purchase(),
      // home: const TermAndCondition(),
      // home: Responsive(),
// home: CompanyDetail(),
      // home: DesktopResponsive(),
      home: Intermediate(),
      // home: SearchScreen(),

      // home: PostShareSecondary(),
      // home: const Subscribers(),
      // home: UserProfile(),

      // home: LoginScreen(),

      // home: HistoryWidget(),
      // home: Subscribers(),
      // home: CompanyProfileWidget(),

      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
