import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n?.startScreenTitle ?? 'Edit Snap'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                    'こんにちは!\n今日は${DateFormat('yyyy年MM月dd日 HH:mm').format(DateTime.now())}です',
                    textAlign: TextAlign.center, 
                ),
                ElevatedButton(
                    child: Text(l10n?.start ?? '開始する'),
                    onPressed: () {},
                ),
            ],
        ),
      ),
    );
  }
}