import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter/foundation.dart'; // 画像データとしてUnit8List型を使用するためにimport
import 'gen/assets.gen.dart';

class ImageEditScreen extends StatefulWidget {
  const ImageEditScreen({super.key, required this.imageBitmap});
  final Uint8List imageBitmap;

  @override
  State<ImageEditScreen> createState() => _ImageEditScreenState();
}

class _ImageEditScreenState extends State<ImageEditScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n?.imageEditScreenTitle ?? '画像を編集')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.memory(widget.imageBitmap),
            IconButton(
              icon: Assets.rotateIcon.svg(width: 24, height: 24), // フレームワーク組み込みのアイコン
              onPressed: () {},
            ),
            IconButton(
              icon: Assets.flipIcon.svg(width: 24, height: 24),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}