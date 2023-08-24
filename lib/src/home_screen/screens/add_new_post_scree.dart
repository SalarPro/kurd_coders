import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kurd_coders/src/constants/assets.dart';
import 'package:kurd_coders/src/my_widgets/k_text_filed.dart';

class AddNewPostScreen extends StatefulWidget {
  const AddNewPostScreen({super.key});

  @override
  State<AddNewPostScreen> createState() => _AddNewPostScreenState();
}

class _AddNewPostScreenState extends State<AddNewPostScreen> {
  File? myImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            KTextField(
              hint: "Paragraph",
              title: "Paragraph",
            ),
            if (myImageFile == null)
              Image.asset(
                Assets.resourceIconsAddImage,
              ),
            if (myImageFile != null) Image.file(myImageFile!),
            ElevatedButton(
                onPressed: () {
                  selectimage();
                },
                child: Text("Add image"))
          ],
        ),
      ),
    );
  }

  void selectimage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      myImageFile = File(image.path);

      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: myImageFile!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        compressFormat: ImageCompressFormat.jpg,
        maxHeight: 1080,
        maxWidth: 1080,
        compressQuality: 50,
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
          WebUiSettings(
            context: context,
          ),
        ],
      );
      if (croppedFile != null) {
        myImageFile = File(croppedFile.path);
      }
    } else {
      myImageFile = null;
    }
    setState(() {});
  }
}
