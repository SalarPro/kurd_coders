import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class KHelper {
  static Future<File?> pickImage({
    bool cropTheImage = false,
  }) async {
    File? myImageFile;
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        maxHeight: 1920,
        imageQuality: 90);

    if (image != null) {
      // the image that we selected
      myImageFile = File(image.path);

      // if the user requested top crop the image
      if (cropTheImage) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: myImageFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          compressFormat: ImageCompressFormat.jpg,
          maxHeight: 1080,
          maxWidth: 1080,
          compressQuality: 90,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true,
            ),
            IOSUiSettings(
              title: 'Cropper',
            ),
          ],
        );
        if (croppedFile != null) {
          myImageFile = File(croppedFile.path);
        }
      }
    } else {
      myImageFile = null;
    }
    return myImageFile;
  }
}
