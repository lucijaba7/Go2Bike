import 'package:flutter/material.dart';
import 'package:go2bike/l10n/l10n.dart';

//sprema jezik koji želimo
class LocaleProvider extends ChangeNotifier {
  Locale _locale;

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
