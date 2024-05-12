import 'package:ssen_admin/Models/announcement_model.dart';
import 'package:ssen_admin/Models/company_profile_model.dart';
import 'package:ssen_admin/Models/user_model.dart';

abstract class FirebaseAnnouncementAbstract {
  Future<String> create(CompanyProfileModel companyProfileModel,
      AnnouncementModel announcement, UserModel user);
  Future<String> delete(UserModel user, String id, String reason);
  Future<String> update(CompanyProfileModel companyProfileModel);
  Future<AnnouncementModel> read(String id);
}
