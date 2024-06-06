import 'package:ssen_user/Models/purchase_model.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/Models/user_model.dart';

abstract class FirebasePurchaseAbstract {
  Future<String> create(
      PurchaseModel purchase, ShareModel share, UserModel user);
  Future<String> delete(String id);
  Future<String> update(String id, String attribute, String value);
  Future<PurchaseModel> read(String id);
}
