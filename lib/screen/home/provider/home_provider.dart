import 'package:flutter/foundation.dart';

class SliderProvider extends ChangeNotifier
{
  int indexofinage = 0;
  List images = [
    "assets/images/1.ishu.jpg",
    "assets/images/dhamu6.jpg",
    "assets/images/1.prina.jpg",
    "assets/images/1.snehal.jpg",
    "assets/images/2.ishu.jpg",
  ];

  void changeindex(int index)
  {
    indexofinage = index;
    notifyListeners();
  }

}