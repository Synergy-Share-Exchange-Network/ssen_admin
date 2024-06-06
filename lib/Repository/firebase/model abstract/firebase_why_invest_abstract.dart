import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/why_invest.dart';

abstract class FirebaseWhyInvestAbstract {
  Future<String> create(
      CompanyProfileModel companyProfile, WhyInvestModel whyInvest);
  Future<String> delete(String id);
  Future<String> update(CompanyProfileModel companyProfileModel);
  Future<WhyInvestModel> read(String id);
}
