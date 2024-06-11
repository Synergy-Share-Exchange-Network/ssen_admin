import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_admin/Models/user_model.dart';

import '../../Repository/firebase/key words/collection_name.dart';
import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';
import '../../widgets/user_profile_widget.dart';

class User extends StatelessWidget {
  static const route = "User";
  const User({Key? key}) : super(key: key);

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
                'User ',
                style: dark
                    ? STextTheme.darkTextTheme.headlineSmall
                    : STextTheme.lightTextTheme.headlineSmall,
              ),

              backgroundColor:
                  dark ? SColors.darkContainer : SColors.lightContainer,

              // elevation: 1,
            ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(CollectionName.user)
              // .where('isVerified', isEqualTo: true)
              // .where('adminRejection', arrayContains: '')
              .orderBy('userCreatedDate', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              ); // Loading indicator while data is loading.
            }
            List<UserModel> users = snapshot.data!.docs.map((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return UserModel.fromMap(data);
            }).toList();
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserWidget(user: users[index]);
              },
            );
          }),
    );
  }
}
