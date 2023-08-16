import 'package:flutter/material.dart';
import 'package:kurd_coders/src/constants/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 100,
        top: MediaQuery.of(context).padding.top,
      ),
      children: [
        cellType1(haveImage: true),
        cellType1(haveImage: false),
        cellType1(haveImage: false),
        cellType1(haveImage: true),
        cellType1(haveImage: true),
      ],
    );
  }

  Widget cellType1({required bool haveImage}) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(8),
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
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: Image.asset(
                      Assets.resourceImagesPersone,
                      width: 40,
                      height: 40,
                    ).image,
                  ),
                  SizedBox(width: 10),
                  Text("Azad Khorshed")
                ],
              ),
              SizedBox(height: 10),
              Text(
                "I have a question about Flutter UI, how can question about Flutter UI, how can ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              if (haveImage)
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset(
                    Assets.resourceImagesCodeImage,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 30,
          child: Container(
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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "1.4 K",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 4),
                Image.asset(
                  Assets.resourceIconsIconLike,
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 150,
          child: Container(
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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "255",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 4),
                Image.asset(
                  Assets.resourceIconsIconComment,
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
