import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signUp() async {
    // todo
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }

    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    ))
        .user;
    final name = user.email;

    FirebaseFirestore.instance.collection('users').add(
      {
        "email": user.email,
        'createdAt': Timestamp.now(),
      },
    );
  }
}
