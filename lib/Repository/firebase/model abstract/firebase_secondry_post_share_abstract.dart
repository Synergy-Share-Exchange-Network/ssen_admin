import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/secondry_post_share.dart';
import 'package:ssen_user/Models/user_model.dart';

abstract class FirebaseSecondryPostShareAbstract {
  Future<String> create(SecondryPostShareModel secondryPostShare,
      UserModel user, CompanyProfileModel company);
  Future<String> delete(String id);
  Future<String> update(SecondryPostShareModel secondryPostShare);
  Future<SecondryPostShareModel> read(String id);
}
