import 'dart:io';

import 'package:demoapp/core/images/image_type_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../custom_widgets/bottom_sheet/choose_gallery_or_camera_bottom_sheet.dart';
import '../utils/navigator_methods.dart';
import 'image_compress_isolate.dart';

class ImageMethods {
  static Future<void> pickImage({
    required ImageSource source,
    ImageType type = ImageType.avatar, 
    required void Function(File) onSuccess,
  }) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: source,
      imageQuality: 100,
    );

    if (pickedImage == null) return;

    final File compressed = await ImageCompressIsolate.compress(
      File(pickedImage.path),
      type: type,
    );

    onSuccess.call(compressed);
  }

  static Future<void> pickMultiImage({
    ImageType type = ImageType.avatar, 
    required void Function(List<File>) onSuccess,
  }) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedImages =
        await picker.pickMultiImage(imageQuality: 100);

    if (pickedImages.isEmpty) return;

    final List<File> result = [];

    for (final img in pickedImages) {
      final compressed = await ImageCompressIsolate.compress(
        File(img.path),
        type: type,
      );
      result.add(compressed);
    }

    onSuccess.call(result);
  }

  static void pickImageBottomSheet(
    BuildContext context, {
    ImageType type = ImageType.avatar, 
    required void Function(File) onSuccessCamera,
    required void Function(List<File>) onSuccessGallery,
  }) {
    NavigatorMethods.showAppBottomSheet(
      context,
      ChooseGalleryOrCameraBottomSheet(
        onCamera: () {
          pickImage(
            source: ImageSource.camera,
            type: type,
            onSuccess: (file) {
              Navigator.pop(context);
              onSuccessCamera.call(file);
            },
          );
        },
        onGallery: () {
          pickMultiImage(
            type: type,
            onSuccess: (files) {
              Navigator.pop(context);
              onSuccessGallery.call(files);
            },
          );
        },
      ),
    );
  }
}
