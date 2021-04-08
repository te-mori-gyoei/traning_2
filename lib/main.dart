import 'package:flutter/material.dart';
import 'package:flutter_firebase/main_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_)=> MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title:Column(
              children:[
                Text(
                  'ぎょうえいのアプリケーション',
                ),
              ],
            ),
          ),
          body: Consumer<MainModel>(
            builder: (context, model, child) {
              return Center(
                child: Column(
                  children:[
                    Text(
                        model.hungryText,
                        style: TextStyle(
                            fontSize: 30
                        ),
                ),
                        RaisedButton(
                          child: Text(
                              'ボタン'
                          ),
                          onPressed: (){
                            // todo ここで何かする
                            model.changeHungryText();
                          },
                        ),
                  ]
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
