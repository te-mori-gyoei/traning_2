import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  String welcomeText = 'ようこそ図書館へ';

  void changeHungryText() {
    welcomeText = 'またおこしください';
    notifyListeners();
  }
}
