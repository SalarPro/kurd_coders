class CommentModel {
  String? id;
  String? userId;
  String? comment;
  DateTime? createdAt;

  List<CommentModel>? comments;

  CommentModel({
    this.id,
    this.userId,
    this.comment,
    this.comments,
    this.createdAt,
  });
}
