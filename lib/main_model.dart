import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  String welcomeText = 'ようこそ図書館へ';

  void changeWelcomeText() {
    welcomeText = 'またおこしください';
    notifyListeners();
  }
}
