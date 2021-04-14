import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/presentation/book_add/add_book_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase/domain/book.dart';

class AddBookPage extends StatelessWidget {
  AddBookPage({this.book});
  final Book? book;
  @override
  Widget build(BuildContext context) {
    final bool isUpdate = book != null;
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(isUpdate ? '本を編集' : '本を追加'),
        ),
        body: Consumer<AddBookModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (text) {
                      model.bookTitle = text;
                    },
                  ),
                  RaisedButton(
                    child: Text('追加する'),
                    onPressed: () async {
                      // todo firestoreに本を追加

                      try {
                        await model.addBookToFirebase();
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("保存しました！！"),
                              actions: <Widget>[
                                // コンテンツ領域
                                FlatButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(e.toString()),
                              actions: <Widget>[
                                // コンテンツ領域
                                FlatButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
