import 'package:flutter/material.dart';

class BottomNavigationBarViewModel extends ChangeNotifier {
  ValueNotifier<int> pageIndex = ValueNotifier(0);
  ValueNotifier<bool> isOpen = ValueNotifier(false);

}
