import 'package:demo/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LocaleNewScreen extends StatelessWidget {
  const LocaleNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appBarTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.title,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
