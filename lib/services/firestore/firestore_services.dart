import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices<T> {
  String _logName = "Firestore service";

  final String collection;

  FirestoreServices(this.collection);

  _logError(e) => log("Firestore error", name: _logName, error: e);

  // Generate ID
  String generateId() {
    return FirebaseFirestore.instance.collection(collection).doc().id;
  }

  // ADD
  Future<DocumentReference> add(Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .add(data)
        .catchError((e) {
      _logError(e);
    });
  }

  // Set function
  Future<void> set(String id, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(data, SetOptions(merge: true))
        .catchError((e) => _logError(e));
  }

  // Merge

  Future<void> merge(String id, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(data, SetOptions(merge: true))
        .catchError((e) => _logError(e));
  }
}
