import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kurd_coders/src/constants/assets.dart';
import 'package:kurd_coders/src/helper/k_colors.dart';
import 'package:kurd_coders/src/helper/k_text_style.dart';
import 'package:kurd_coders/src/models/comment_model.dart';
import 'package:kurd_coders/src/models/post_model.dart';
import 'package:kurd_coders/src/my_widgets/k_text_filed.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';

class PostViewScreen extends StatefulWidget {
  const PostViewScreen(
      {super.key, required this.post, this.isToOpenTheCOmment = false});

  final PostModel post;
  final bool isToOpenTheCOmment;

  @override
  State<PostViewScreen> createState() => _PostViewScreenState();
}

class _PostViewScreenState extends State<PostViewScreen> {
  var commentETC = TextEditingController();
  var focusNode = FocusNode();

  late PostModel post;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    post = widget.post;

    if (widget.isToOpenTheCOmment) {
      Future.delayed(const Duration(milliseconds: 50), () {
        focusNode.requestFocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  get _appBar => AppBar(
        title: const Text('Post View'),
      );

  get _body => SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            postOwner(),
            const SizedBox(height: 10),
            postText(),
            const SizedBox(height: 10),
            if (widget.post.imageUrl != null) postImage(),
            const SizedBox(height: 0),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 16,
                ),
                likeWidget(),
                SizedBox(
                  width: 16,
                ),
                commentWidget()
              ],
            ),
            commentSection(),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      );

  Widget commentWidget() {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
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
    );
  }

  Widget postImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
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
            return const Text("Image Not available");
          },
        ),
      ),
    );
  }

  Padding postText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
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
    );
  }

  Widget postOwner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: Image.asset(
              Assets.resourceImagesPersone,
              width: 40,
              height: 40,
            ).image,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Azad Khorshed",
                style: TextStyle(fontSize: 15),
              ),
              if (widget.post.createdAt != null)
                Text(
                  DateFormat('M/d hh:mma').format(widget.post.createdAt!),
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
            ],
          )
        ],
      ),
    );
  }

  Container likeWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black.withAlpha(100),
            offset: const Offset(2, 4),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LikeButton(
            likeCount: post.likesUserUID?.length ?? 0,
            isLiked: post.likesUserUID?.contains("2210") ?? false,
            onTap: (value) async {
              return !value;
            },
          ),
        ],
      ),
    );
  }

  Widget commentSection() {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        KTextField(
          focusNode: focusNode,
          controller: commentETC,
          hint: "Write a comment",
          dynamicHeight: true,
          suffixIcon: IconButton(
              onPressed: () => postComment(), icon: Icon(Icons.send)),
        ),

        // for (var i = 0; i < (widget.post.comments?.length ?? 0); i++)
        //   commentCell(widget.post.comments![i]),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: post.comments?.length ?? 0,
          itemBuilder: (conetxt, index) {
            return commentCell(widget.post.comments![index]);
          },
        )
      ],
    );
  }

  Widget commentCell(CommentModel comment) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black.withAlpha(100),
            offset: Offset(2, 4),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: Image.asset(
              Assets.resourceImagesPersone,
              width: 40,
              height: 40,
            ).image,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.comment ?? "",
                  style: KTextStyle.textColorDark(18),
                ),
                if (comment.createdAt != null)
                  Text(
                    DateFormat('M/d hh:mma').format(comment.createdAt!),
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  postComment() {
    var comment = commentETC.text.trim();

    if (comment.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please write a comment"),
        backgroundColor: KColors.dangerColor,
      ));
      return;
    }

    post.comments?.add(CommentModel(
      comment: comment,
      userId: "1",
      createdAt: DateTime.now(),
    ));

    FocusManager.instance.primaryFocus?.unfocus();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Comment Sent"),
      backgroundColor: KColors.successColor,
    ));

    commentETC.clear();

    Future.delayed(const Duration(milliseconds: 200), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutBack,
      );
    });

    setState(() {});
  }
}
