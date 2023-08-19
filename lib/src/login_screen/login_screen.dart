// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kurd_coders/src/constants/assets.dart';
import 'package:kurd_coders/src/home_screen/main_screen.dart';
import 'package:kurd_coders/src/my_widgets/k_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: _body,
    );
  }

  Widget get _body {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            bannerView,
            SizedBox(height: 30),
            // emailTextField,
            KTextField(
              title: "Email",
              hint: 'name@example.com',
              controller: TextEditingController(),
              icon: Assets.resourceIconsMail,
            ),
            KTextField(
              isPassword: true,
              title: "Password",
              controller: TextEditingController(),
              icon: Assets.resourceIconsPassword,
            ),
            SizedBox(
              height: 30,
            ),
            loginBtn,
            // Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget get bannerView {
    return Stack(
      children: [
        Image.asset(Assets.resourceImagesLoginBgTop),
        Positioned(
          top: 30,
          left: 40,
          child: Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            Assets.resourceIconsLogo,
            width: 100,
            height: 100,
          ),
        )
      ],
    );
  }

  Widget get loginBtn {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (contex) => MainScreen()));
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffF7E987),
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black.withAlpha(100),
                offset: Offset(2, 4),
              )
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 25),
              Image.asset(
                Assets.resourceIconsIconLogin,
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
