import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/share_model.dart';

abstract class FirebaseShareAbstract {
  Future<String> create(ShareModel share, CompanyProfileModel companyProfile);
  Future<String> delete(String id);
  Future<String> update(ShareModel companyProfileModel);
  Future<ShareModel> read(String id);
}
