import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kurd_coders/src/constants/assets.dart';
import 'package:kurd_coders/src/damy_data.dart';
import 'package:kurd_coders/src/models/post_model.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> homePost = [];

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    homePost = myPosts;
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (homePost.isEmpty) {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 100,
          top: MediaQuery.of(context).padding.top,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return loadingCell();
        },
      );
    } else {
      return ListView.builder(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 100,
            top: MediaQuery.of(context).padding.top,
          ),
          itemCount: homePost.length,
          itemBuilder: (context, index) {
            return cellType1(post: homePost[index]);
          });
    }
  }

  Widget cellType1({required PostModel post}) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Azad Khorshed",
                        style: TextStyle(fontSize: 15),
                      ),
                      if (post.createdAt != null)
                        Text(
                          DateFormat('M/d hh:mma').format(post.createdAt!),
                          style: TextStyle(
                              fontSize: 11, color: Colors.grey.shade500),
                        ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        post.text ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              if (post.imageUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: CachedNetworkImage(
                    imageUrl: post.imageUrl!,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade400,
                        child: Container(
                          width: double.infinity,
                          height: 350,
                          color: Colors.red,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Text("Image Not available");
                    },
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
                  post.likesUserUID?.length.toString() ?? "0",
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
                  post.comments?.length.toString() ?? "0",
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

  Widget loadingCell() {
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
                  Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey.shade400,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: Image.asset(
                        Assets.resourceImagesPersone,
                        width: 40,
                        height: 40,
                      ).image,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade400,
                        child: Container(
                          width: 130,
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade400,
                        child: Container(
                          width: 130,
                          height: 9,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade400,
                        child: Container(
                          width: 130,
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey.shade400,
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 30,
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey.shade400,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "0",
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
        ),
        Positioned(
          bottom: 0,
          left: 150,
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey.shade400,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "0",
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
        ),
      ],
    );
  }
}
