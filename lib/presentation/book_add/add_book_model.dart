import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/domain/book.dart';

class AddBookModel extends ChangeNotifier {
  late String bookTitle = '';

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }
    FirebaseFirestore.instance.collection('books').add(
      {
        'title': bookTitle,
        'create': Timestamp.now(),
      },
    );
  }
}
