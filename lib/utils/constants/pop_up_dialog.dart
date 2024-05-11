import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context) {
 AwesomeDialog(context: context,
 dialogType: DialogType.success,
 animType: AnimType.topSlide,
 showCloseIcon: true,
 title: 'warning',
 desc:'This is the description of the awsome dialoge',
 ).show();
}
void showWarningDialog(BuildContext context) {
  double dialogWidth = MediaQuery.of(context).size.width < 600 ? 300 : 500;
 AwesomeDialog(context: context,
 dialogType: DialogType.warning,
 animType: AnimType.topSlide,
 showCloseIcon: true,
 title: 'warning',
 desc:'Are You Sure To SignUP',
 btnOkText: 'Yes', // Change button text to "Yes"
    btnCancelText: 'No', // Change button text to "No"
 btnOkOnPress: (){},
btnCancelOnPress: (){print('yes');}
 ).show();
}
void showErrorDialog(BuildContext context) {
 AwesomeDialog(context: context,
 dialogType: DialogType.error,
 animType: AnimType.topSlide,
 showCloseIcon: true,
 title: 'Error',
 desc:'SomeThing wrong',

 btnOkOnPress: (){},

 ).show();
}
