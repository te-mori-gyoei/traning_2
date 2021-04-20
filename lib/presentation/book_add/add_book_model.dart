import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/domain/book.dart';
import 'package:image_picker/image_picker.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';
  File imageFile;
  String imageURL = '';
  bool isLoading = false;

  Future showImagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    imageFile = File(pickedFile.path);
    notifyListeners();
  }

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }

    final imageURL = await _uploadImage();
    FirebaseFirestore.instance.collection('books').add(
      {
        'title': bookTitle,
        'imageURL': imageURL,
        'create': Timestamp.now(),
      },
    );
  }

  Future updateBook(Book book) async {
    final document =
        FirebaseFirestore.instance.collection('books').doc(book.documentID);
    final imageURL = await _uploadImage();
    await document.update(
      {
        'title': bookTitle,
        'imageURL': imageURL,
        'updateAt': Timestamp.now(),
      },
    );
  }

  Future<String> _uploadImage() async {
    // todo ストレージへのアップロード
    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot =
        await storage.ref().child("books/$bookTitle").putFile(imageFile);

    final String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
