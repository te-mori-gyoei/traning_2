import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/presentation/book_list/book_list_page.dart';
import 'package:flutter_firebase/presentation/login/login_page.dart';
import 'package:flutter_firebase/presentation/main/main_model.dart';
import 'package:flutter_firebase/presentation/signup/signup_model.dart';
import 'package:flutter_firebase/presentation/signup/signup_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // ここ大事！
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Text(
                  'ぎょうえいのアプリケーション',
                ),
              ],
            ),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Center(
              child: Column(children: [
                Text(
                  model.welcomeText,
                  style: TextStyle(fontSize: 30),
                ),
                RaisedButton(
                  child: Text('本一覧'),
                  onPressed: () {
                    // todo ここで何かする
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookListPage()),
                    );
                    model.changeWelcomeText();
                  },
                ),
                RaisedButton(
                  child: Text('新規登録'),
                  onPressed: () {
                    // todo ここで何かする
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                    model.changeWelcomeText();
                  },
                ),
                RaisedButton(
                  child: Text('ログイン'),
                  onPressed: () {
                    // todo ここで何かする
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                    model.changeWelcomeText();
                  },
                ),
              ]),
            );
          }),
        ),
      ),
    );
  }
}
