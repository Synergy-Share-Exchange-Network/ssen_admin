import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssen_admin/Models/ML%20models/ML_general_attribute_model.dart';
import 'package:ssen_admin/Repository/firebase/key%20words/collection_name.dart';

class FirebaseGeneralAttribute {
  Future<String> createGeneralattribute(
      MLGeneralAttributeModel mlattributemodel) async {
    String res = "Some error has occured";
    try {
      // Check if document exists first
      DocumentReference docRef = FirebaseFirestore.instance
          .collection(CollectionName.MLdata)
          .doc(CollectionName.general)
          .collection(CollectionName.general)
          .doc(CollectionName.general);

      DocumentSnapshot snapshot = await docRef.get();

      if (snapshot.exists) {
        // Update existing document
        await docRef.update(mlattributemodel.toMap());
        res = "Updated successfully";
      } else {
        // Create a new document
        await docRef.set(mlattributemodel.toMap());
        res = "Created successfully";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
