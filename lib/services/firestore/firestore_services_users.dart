import 'package:appbeer/models/user_model.dart';
import 'package:appbeer/services/firestore/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseUsers {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String _collection = "userExamples";
  static final FirestoreServices _service = FirestoreServices(_collection);

  Future createUser(UserModel user) async {
    try {
      await _firestore.collection(_collection).doc(user.uid!).set({
        "uid": user.uid,
        "email": user.email,
        "name": user.name,
        "photoUrl": user.photoUrl,
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static mergeUserData(UserModel user) {
    Map<String, dynamic> data = {
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "photoUrl": user.photoUrl
    };
    _service.merge(user.uid!, data);
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("userExamples").doc(uid).get();

      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
