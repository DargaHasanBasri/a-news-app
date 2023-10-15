import 'package:a_news_app/base/base_view_model.dart';
import 'package:flutter/foundation.dart';

import '../../../models/response/currency_response_model.dart';

class BottomNavigationBarViewModel extends BaseViewModel {
  ValueNotifier<int> pageIndex = ValueNotifier(0);
  ValueNotifier<bool> isOpen = ValueNotifier(false);
  ValueNotifier<CurrencyResponseModel?> currencyResponseNotifier = ValueNotifier(null);

  void fetchCurrency() async {
    final response = await repository.getCurrency();
    currencyResponseNotifier.value = response;
  }

  List<String> categoriesTitle = [
    "Tümü",
    "Konular",
    "Gündem",
    "Bilim",
    "Yazılım",
    "Kültür & Sanat",
    "Gezi",
    "Spor",
    "Eğlence",
    "Sağlık",
    "Teknoloji",
    "Yaşam",
  ];
}
