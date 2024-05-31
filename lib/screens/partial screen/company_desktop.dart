// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../services/theme/text_theme.dart';
// import '../../utils/constants/colors.dart';
// import '../../utils/helper_function.dart';
// import '../../widgets/company_profile_widget.dart';
// import '../../widgets/user_profile_widget.dart';

// class CompanyDesktop extends StatelessWidget {
//   const CompanyDesktop({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final dark = SHelperFunction.isDarkMode(context);
//     return Scaffold(
//        appBar: AppBar(
       
//           backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
//           elevation: 0,
//           actions: [
//             IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
//           ],
//            title: Text(
//           'Company ',
//           style: dark
//               ? STextTheme.darkTextTheme.headlineSmall
//               : STextTheme.lightTextTheme.headlineSmall,
//         ),

//         centerTitle: true,
         
//         ),
//       body: SingleChildScrollView(child: Column(
//         children: [
//           CompanyWidget()
//         ],
//       )),
//     );
    
//   }
// }
