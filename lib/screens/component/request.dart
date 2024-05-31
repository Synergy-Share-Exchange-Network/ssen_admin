import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ssen_admin/Models/company_profile_model.dart';
import 'package:ssen_admin/Repository/firebase/key%20words/collection_name.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';
import '../../widgets/request_widget.dart';
import '../request_detail.dart';
import '../request_history.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              dark ? SColors.darkContainer : SColors.lightContainer,
          elevation: 0,
          title: Text(
            'Request',
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
          centerTitle: true,
          bottom: TabBar(
              labelColor: dark ? SColors.white : SColors.black,
              tabs: const [
                Tab(
                  child: Text(
                    "Regstration",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
                Tab(
                  child: Text(
                    "History",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
              ]),
        ),
        body: (TabBarView(children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(CollectionName.organization)
                  .where('isVerified', isEqualTo: false)
                  .where('adminRejection', arrayContains: '')
                  .orderBy('createdDay', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ); // Loading indicator while data is loading.
                }
                List<CompanyProfileModel> companies =
                    snapshot.data!.docs.map((document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return CompanyProfileModel.fromMap(data);
                }).toList();
                return ListView.builder(
                  itemCount: companies.length,
                  itemBuilder: (context, index) {
                    return RequestWidget(company: companies[index]);
                  },
                );
              }),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(CollectionName.organization)
                  .where('isVerified', isEqualTo: false)
                  .where('adminRejection', arrayContains: '')
                  .orderBy('createdDay', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ); // Loading indicator while data is loading.
                }
                List<CompanyProfileModel> companies =
                    snapshot.data!.docs.map((document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return CompanyProfileModel.fromMap(data);
                }).toList();
                List<CompanyProfileModel> companiesFinal =
                    companies.where((company) {
                  return !ListEquality().equals(company.adminRejection,
                      ['']); // Check if adminRejection is not equal to ['']
                }).toList();
                // print(companies);
                // print(companiesFinal);
                for (var element in companies) {
                  print(element.adminRejection);
                  print("======================");
                }
                print("flsdfg;dfh;idfug;zdfuh;sidf================");
                for (var element in companiesFinal) {
                  print(element.adminRejection);
                  print("======================");
                }

                return ListView.builder(
                  itemCount: companiesFinal.length,
                  itemBuilder: (context, index) {
                    return RequestHistory(company: companiesFinal[index]);
                  },
                );
              }),
        ])),
      ),
    );
  }
}
