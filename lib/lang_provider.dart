import 'package:flutter/cupertino.dart';

class LangProvider with ChangeNotifier {
  Locale _currentLocale = const Locale("en");

  Locale get currentLocale => _currentLocale;

  void changeLocale(String _locale) {
    _currentLocale = Locale(_locale);
    notifyListeners();
  }
}
