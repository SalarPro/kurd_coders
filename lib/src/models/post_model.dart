import 'package:kurd_coders/src/models/comment_model.dart';

class PostModel {
  String? id;
  String? userId;
  String? text;
  String? imageUrl;

  List<String>? likesUserUID;

  List<CommentModel>? comments;

  DateTime? createdAt;
  DateTime? updateAt;

  PostModel({
    this.id,
    this.userId,
    this.text,
    this.imageUrl,
    this.likesUserUID,
    this.comments,
    this.createdAt,
    this.updateAt,
  });
}

