import 'package:demo/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LocaleManager extends ChangeNotifier {
  Locale locale = const Locale('en');

  void changeLocale(Locale newLocale) {
    if (AppLocalizations.supportedLocales.contains(newLocale)) {
      locale = newLocale;
      notifyListeners();
    }
  }
}
