import 'package:a_news_app/base/repository.dart';
import 'package:flutter/cupertino.dart';

import '../services/service_locator.dart';


class BaseViewModel extends ChangeNotifier {
  Repository repository = locator<Repository>();
}