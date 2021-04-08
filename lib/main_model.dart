import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier{
  String hungryText = 'おなかすいた';

  void changeHungryText(){
    hungryText = '満腹';
    notifyListeners(

    );
  }
}

