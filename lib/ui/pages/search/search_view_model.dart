import 'package:flutter/cupertino.dart';

class SearchViewModel extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  ScrollController pageScrollController = ScrollController();
  ValueNotifier<bool> isAdd = ValueNotifier(false);
}