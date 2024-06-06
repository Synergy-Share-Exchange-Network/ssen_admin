import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/why_invest.dart';
import 'package:ssen_user/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_user/Repository/firebase/model%20abstract/firebase_why_invest_abstract.dart';

import 'package:uuid/uuid.dart';

class FirebasewhyInvestMethod implements FirebaseWhyInvestAbstract {
  @override
  Future<String> create(
      CompanyProfileModel companyProfile, WhyInvestModel whyInvest) async {
    String res = "Some error has occured"; // error message
    whyInvest.companyId = companyProfile.identification;
    whyInvest.dateAdded = DateTime.now().toString();
    whyInvest.identification = const Uuid().v1();
    try {
      //creating a why invest entry
      await FirebaseFirestore.instance
          .collection(CollectionName.whyInvest)
          .doc(whyInvest.identification)
          .set(whyInvest.toMap());
      //Updating the company with the new Why Invest ID
      List<String> whyInvestID = companyProfile.whyInvestID;
      whyInvestID.insert(0, whyInvest.identification);
      whyInvestID =
          whyInvestID.where((whyInvestID) => whyInvestID.isNotEmpty).toList();
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .update({'whyInvestID': whyInvestID});

      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<String> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String> update(CompanyProfileModel companyProfileModel) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<WhyInvestModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.whyInvest)
          .doc(id)
          .get();

      Map<String, dynamic>? whyInvestData = snap.data();
      return WhyInvestModel.fromMap(whyInvestData!);
    } catch (e) {
      WhyInvestModel whyInvest =
          WhyInvestModel(identification: 'Error :${e.toString()}');
      return whyInvest;
    }
  }
}
