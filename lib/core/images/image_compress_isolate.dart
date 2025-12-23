import 'dart:io';
import 'dart:isolate';

import 'package:demoapp/core/images/image_type_enum.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

import 'image_compress_config.dart';

class ImageCompressIsolate {
  static Future<File> compress(
    File file, {
    ImageType type = ImageType.avatar, 
  }) async {
    final receivePort = ReceivePort();

    await Isolate.spawn(
      _compressImage,
      [
        receivePort.sendPort,
        file.path,
        type.index,
      ],
    );

    final String compressedPath = await receivePort.first;
    return File(compressedPath);
  }

  static Future<void> _compressImage(List<dynamic> args) async {
    final SendPort sendPort = args[0];
    final String filePath = args[1];
    final ImageType type = ImageType.values[args[2]];

    final config = ImageCompressConfig.fromType(type);

    final tempDir = await getTemporaryDirectory();
    final targetPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      filePath,
      targetPath,
      quality: config.quality,
      minWidth: config.minWidth,
      minHeight: config.minHeight,
      format: config.format,
    );

    sendPort.send(compressedFile!.path);
  }
}
