import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future login() async {
    // todo
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }

    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }
    final result = (await _auth.signInWithEmailAndPassword(
      email: mail,
      password: password,
    ));
    final uid = result.user.uid;
    // todo 端末に保存
  }
}
