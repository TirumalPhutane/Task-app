import 'package:demo/l10n/app_localizations.dart';
import 'package:demo/main.dart';
import 'package:demo/navigation/route_names.dart';
import 'package:flutter/material.dart';

class LocalizationScreen extends StatelessWidget {
  const LocalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.appBarTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizations.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => localeManager.changeLocale(const Locale('en')),
              child: Text(localizations.englishOption),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => localeManager.changeLocale(const Locale('mr')),
              child: Text(localizations.marathiOption),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.localeNewScreen);
              },
              child: Text(localizations.nextOption),
            ),
          ],
        ),
      ),
    );
  }
}
