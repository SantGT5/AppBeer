import 'package:appbeer/models/user_model.dart';
import 'package:appbeer/pages/home.dart';
import 'package:appbeer/pages/login_register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

  RxBool checkboxValue = false.obs;
  RxBool obscurePassConfirmation = true.obs;
  RxBool obscureTextPass = true.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();

  @override
  void onReady() async {
    // Run every time Auth state change

    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);
    super.onReady();
  }

// Firebase user in realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  handleAuthChanged(_firebaseUser) async {
    if (_firebaseUser?.uid != null) {
      if (firebaseUser.value?.isAnonymous == false)
        firestoreUser.bindStream(streamFirestoreUser());
    }
    if (_firebaseUser == null) {
      Get.offAll(LoginRegister());
    } else {
      Get.offAll(Home());
    }
  }

// Stream of firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    return _db.doc("users/${firebaseUser.value!.uid}").snapshots().map(
        (snapshot) =>
            UserModel.fromJson(snapshot.data() as Map<String, dynamic>));
  }

  Future<User> signInAnonymous() async {
    UserCredential result = await _auth.signInAnonymously();

    print(result.user!.isAnonymous);

    return result.user!;
  }

  Future<void> updateUser(BuildContext context, UserModel user) async {
    try {
      _db.doc('/users/${user.uid}').update(user.toJson());
      update();
    } catch (err) {
      print("$err");
    }
  }

  Future<User?> signInGoogle() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential result = await _auth.signInWithCredential(credential);

      print(result.user!.displayName);
      print(result.user!.email);
      print(result.user!.photoURL);
      print(result.user!.uid);

      return result.user;
    }

    return null;
  }

  // Sign out
  Future<void> signOut() {
    _googleSignIn.signOut();
    return _auth.signOut();
  }
}
