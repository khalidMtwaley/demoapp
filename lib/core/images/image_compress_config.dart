import 'package:demoapp/core/images/image_type_enum.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageCompressConfig {
  final int quality;
  final int minWidth;
  final int minHeight;
  final CompressFormat format;

  const ImageCompressConfig({
    required this.quality,
    required this.minWidth,
    required this.minHeight,
    required this.format,
  });

  static ImageCompressConfig fromType(ImageType type) {
    switch (type) {
      case ImageType.avatar:
        return const ImageCompressConfig(
          quality: 80, 
          minWidth: 720,
          minHeight: 720,
          format: CompressFormat.jpeg,
        );

      case ImageType.cover:
        return const ImageCompressConfig(
          quality: 80,
          minWidth: 1600,
          minHeight: 900,
          format: CompressFormat.jpeg,
        );

      case ImageType.document:
        return const ImageCompressConfig(
          quality: 88, 
          minWidth: 1800,
          minHeight: 1800,
          format: CompressFormat.jpeg,
        );

      case ImageType.product:
        return const ImageCompressConfig(
          quality: 82,
          minWidth: 2048,
          minHeight: 2048,
          format: CompressFormat.jpeg,
        );

      case ImageType.banner:
        return const ImageCompressConfig(
          quality: 80,
          minWidth: 2400,
          minHeight: 1200,
          format: CompressFormat.jpeg,
        );

      case ImageType.thumbnail:
        return const ImageCompressConfig(
          quality: 70,
          minWidth: 400,
          minHeight: 400,
          format: CompressFormat.jpeg,
        );

      case ImageType.chatImage:
        return const ImageCompressConfig(
          quality: 75,
          minWidth: 1280,
          minHeight: 1280,
          format: CompressFormat.jpeg,
        );

      case ImageType.story:
        return const ImageCompressConfig(
          quality: 82,
          minWidth: 1080,
          minHeight: 1920,
          format: CompressFormat.jpeg,
        );
    }
  }
}
