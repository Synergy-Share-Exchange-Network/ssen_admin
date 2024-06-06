import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/log_model.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_user/Repository/firebase/model%20abstract/firebase_share_abstract.dart';
import 'package:ssen_user/Repository/firebase/model%20methods/firebase_log_methods.dart';
import 'package:uuid/uuid.dart';

class FirebaseShareMethods implements FirebaseShareAbstract {
  @override
  Future<String> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ShareModel> read(String id) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection(CollectionName.share)
          .doc(id)
          .get();

      Map<String, dynamic>? shareData = snap.data();
      return ShareModel.fromMap(shareData!);
    } catch (e) {
      ShareModel shareModel = ShareModel(
          savingAccountPercentage: 000,
          proclamationNumber: '',
          minimumNumberOfBuyer: 00,
          maximumNumberOfBuyer: 00,
          bankInformation: ['', ''],
          shareImage: ['', ''],
          unitSharePrice: 00,
          noOfShares: 0,
          divident: 00,
          minimumPaymentInPercent: 00,
          minimumNumberOfSharesToBuy: 00,
          maximumNumberOfSharesToBuy: 00);
      return shareModel;
    }
  }

  @override
  Future<String> update(ShareModel companyProfileModel) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<String> create(
      ShareModel share, CompanyProfileModel companyProfile) async {
    String res = "";
    try {
      print("in");
      //creating purchase
      share.identification = const Uuid().v8();
      // share.bankInformation = companyProfile.bankAccount;
      share.companyID = companyProfile.identification;
      // share.currency=companyProfile
      share.dateAdded = DateTime.now().toString();
      share.isDeleted = false;
      share.isHidden = false;
      // share.
      // share.noOfShares=companyProfile.
      await FirebaseFirestore.instance
          .collection(CollectionName.share)
          .doc(share.identification)
          .set(share.toMap());

      // updating company
      String? shares = companyProfile.shareID;
      await FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .doc(companyProfile.identification)
          .update({'shareID': shares});
      // share.insert(0, share.identification);
      // announcements = announcements
      //     .where((announcements) => announcements.isNotEmpty)
      //     .toList();

//logging the addition
      // FirebaseLogMethods().create(
      //     user1,
      //     share.identification,
      //     ModifiedEntity.product,
      //     LogLevel.info,
      //     LogAction.addition,
      //     'reason',
      //     ['']);

      print("out");
//logging the addition
      // FirebaseLogMethods().create(
      //     user1,
      //     companyProfile.identification,
      //     ModifiedEntity.product,
      //     LogLevel.info,
      //     LogAction.addition,
      //     'reason',
      //     ['']);
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
