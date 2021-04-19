import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase/presentation/signup/signup_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase/domain/book.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'example@gyoei.com'),
                    controller: mailController,
                    onChanged: (text) {
                      model.mail = text;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'password'),
                    obscureText: true,
                    controller: passwordController,
                    onChanged: (text) {
                      model.password = text;
                    },
                  ),
                  RaisedButton(
                      child: Text('登録する'),
                      onPressed: () async {
                        try {
                          await model.signUp();
                          _showDialog(context, '登録しました');
                        } catch (e) {
                          _showDialog(context, e.toString());
                        }
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            // コンテンツ領域
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
