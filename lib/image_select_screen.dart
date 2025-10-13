import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

class ImageSelectScreen extends StatefulWidget {
  const ImageSelectScreen({super.key});

  @override
  State<ImageSelectScreen> createState() => _ImageSelectScreenState();
}

class _ImageSelectScreenState extends State<ImageSelectScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n?.imageSelectScreenTitle ?? '画像を選択')
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text(l10n?.imageSelect ?? '画像を選択'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text(l10n?.imageEdit ?? '画像を編集'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}