// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kurd_coders/src/constants/assets.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:kurd_coders/src/home_screen/screens/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                Assets.resourceImagesProfileBgTop,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 120,
                child: Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        Image.asset(Assets.resourceImagesPersone).image,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 120,
                child: Center(
                  child: CircularText(
                    children: [
                      TextItem(
                        text: Text(
                          "25y 4m 21d years old",
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // space: 7,
                        startAngle: -90,
                        startAngleAlignment: StartAngleAlignment.center,
                        direction: CircularTextDirection.clockwise,
                      ),
                    ],
                    radius: 70,
                    position: CircularTextPosition.outside,
                    backgroundPaint: Paint()..color = Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Azad Khorshed",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "@AzadKhorshed".toLowerCase(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditPRofileScreen()));
                  },
                  child: SafeArea(
                    child: Image.asset(
                      Assets.resourceIconsEdit,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black.withAlpha(100),
                  offset: Offset(2, 4),
                )
              ],
            ),
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bio",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                    "I have a  about Flutter UI, how can I have a  about Flutter UI, how can I have a question about  UI, how can I have a question about  UI, how can I have a question about Flutter UI, how can question"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
