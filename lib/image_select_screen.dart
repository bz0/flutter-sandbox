import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as image_lib; // Imageウィジェットと名前がかぶるので別名にする
import 'package:flutter/foundation.dart'; // 画像データとしてUnit8List型を使用するためにimport
import 'edit_snap_screen.dart';

class ImageSelectScreen extends StatefulWidget {
  const ImageSelectScreen({super.key});

  @override
  State<ImageSelectScreen> createState() => _ImageSelectScreenState();
}

class _ImageSelectScreenState extends State<ImageSelectScreen> {
  final ImagePicker _picker = ImagePicker(); // 画像ライブラリやカメラへアクセスする機能を提供
  Uint8List? _imageBitmap;

  // 画像選択処理を行うメソッド
  Future<void> _selectImage() async {
    final XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery); // 画像ライブラリやカメラへアクセスする機能
    final imageBitmap = await imageFile?.readAsBytes(); // 画像データをバイト配列として読み込む
    assert(imageBitmap != null);
    if (imageBitmap == null) return;

    final image = image_lib.decodeImage(imageBitmap);
    assert(image != null);
    if (image == null) return;

    final image_lib.Image resizedImage;
    if (image.width > image.height) {
      resizedImage = image_lib.copyResize(image, width: 500);
    } else {
      resizedImage = image_lib.copyResize(image, height: 500);
    }

    setState(() {
      _imageBitmap = image_lib.encodeBmp(resizedImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final imageBitmap = _imageBitmap;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n?.imageSelectScreenTitle ?? '画像を選択')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageBitmap != null) Image.memory(imageBitmap),
            ElevatedButton(
              child: Text(l10n?.imageSelect ?? '画像を選択'),
              onPressed: () => _selectImage(),
            ),
            if (imageBitmap != null) 
              ElevatedButton(
                child: Text(l10n?.imageEdit ?? '画像を編集'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ImageEditScreen(imageBitmap: imageBitmap),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}