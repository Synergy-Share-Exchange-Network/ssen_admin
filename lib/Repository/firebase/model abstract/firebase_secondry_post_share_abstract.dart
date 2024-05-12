

import 'package:ssen_admin/Models/company_profile_model.dart';
import 'package:ssen_admin/Models/secondry_post_share.dart';
import 'package:ssen_admin/Models/user_model.dart';

abstract class FirebaseSecondryPostShareAbstract {
  Future<String> create(SecondryPostShareModel secondryPostShare,
      UserModel user, CompanyProfileModel company);
  Future<String> delete(String id);
  Future<String> update(SecondryPostShareModel secondryPostShare);
  Future<SecondryPostShareModel> read(String id);
}
