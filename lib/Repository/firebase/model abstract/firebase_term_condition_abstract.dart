import 'package:ssen_admin/Models/company_profile_model.dart';
import 'package:ssen_admin/Models/term_condition.dart';

abstract class FirebaseTermConditionAbstract {
  Future<String> create(
      CompanyProfileModel companyProfile, TermConditionModel termCondition);
  Future<String> delete(String id);
  Future<String> update(CompanyProfileModel companyProfileModel);
  Future<TermConditionModel> read(String id);
}
