// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Hello World!';

  @override
  String get appBarTitle => 'Localization Demo';

  @override
  String get englishOption => 'English';

  @override
  String get marathiOption => 'Marathi';

  @override
  String get nextOption => 'Next';
}
