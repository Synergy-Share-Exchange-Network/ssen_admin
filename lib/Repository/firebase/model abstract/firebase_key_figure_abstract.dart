import 'package:ssen_admin/Models/company_profile_model.dart';
import 'package:ssen_admin/Models/key_figure_model.dart';
import 'package:ssen_admin/Models/user_model.dart';

abstract class FirebaseKeyFigureAbstract {
  Future<String> create(CompanyProfileModel companyProfile,
      KeyFigureModel keyFigure, UserModel user);
  Future<String> delete(String id, CompanyProfileModel companyProfile);
  Future<String> update(CompanyProfileModel companyProfileModel);
  Future<KeyFigureModel> read(String id);
}
