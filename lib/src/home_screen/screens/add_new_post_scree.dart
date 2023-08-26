import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kurd_coders/src/constants/assets.dart';
import 'package:kurd_coders/src/helper/helper.dart';
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
    myImageFile = await KHelper.pickImage(cropTheImage: true);
    setState(() {});
  }
}
