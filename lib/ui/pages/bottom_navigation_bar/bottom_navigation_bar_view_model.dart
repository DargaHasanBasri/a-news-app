import 'package:a_news_app/base/base_view_model.dart';
import 'package:flutter/foundation.dart';

class BottomNavigationBarViewModel extends BaseViewModel {
  ValueNotifier<int> pageIndex = ValueNotifier(0);
}
