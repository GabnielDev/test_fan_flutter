import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../registrasi/registrasipage.dart';
// ignore: depend_on_referenced_packages

abstract class Action {
  Future<User?> onClickLogin(
      BuildContext context, String username, String password);

  void onClickRegistrasi(BuildContext context);

  Future<FirebaseApp> initializationFirebase();
}

class LoginBloc implements Action {
  @override
  Future<User?> onClickLogin(
      BuildContext context, String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
    return user;
  }

  @override
  void onClickRegistrasi(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrasiPage()),
    );
  }

  @override
  Future<FirebaseApp> initializationFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
