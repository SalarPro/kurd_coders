import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kurd_coders/src/models/comment_model.dart';
import 'package:uuid/uuid.dart';

class PostModel {
  String? uid;
  String? userUid;
  String? text;
  String? imageUrl;

  List<String>? likesUserUID;

  List<CommentModel>? comments;

  Timestamp? createdAt;
  Timestamp? updateAt;

  PostModel({
    this.uid,
    this.userUid,
    this.text,
    this.imageUrl,
    this.likesUserUID,
    this.comments,
    this.createdAt,
    this.updateAt,
  });

  // fromMap
  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      uid: map['uid'],
      userUid: map['userUid'],
      text: map['text'],
      imageUrl: map['imageUrl'],
      likesUserUID: List<String>.from(map['likesUserUID']),
      comments: List<CommentModel>.from(
          map['comments']?.map((e) => CommentModel.fromMap(e))),
      createdAt: map['createdAt'],
      updateAt: map['updateAt'],
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "userUid": userUid,
      "text": text,
      "imageUrl": imageUrl,
      "likesUserUID": likesUserUID,
      "comments": comments?.map((e) => e.toMap()).toList(),
      "createdAt": createdAt,
      "updateAt": updateAt,
    };
  }

  // create
  Future<void> create() async {
    uid ??= const Uuid().v4();
    createdAt ??= Timestamp.now();
    updateAt ??= Timestamp.now();
    likesUserUID ??= [];
    comments ??= [];
    await FirebaseFirestore.instance.collection("posts").doc(uid).set(toMap());
  }

  // update
  Future<void> update() async {
    updateAt = Timestamp.now();
    await FirebaseFirestore.instance
        .collection("posts")
        .doc(uid)
        .update(toMap());
  }

  // delete
  Future<void> delete() async {
    await FirebaseFirestore.instance.collection("posts").doc(uid).delete();
  }

  static Stream<List<PostModel>> streamAll() {
    return FirebaseFirestore.instance
        .collection("posts")
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map((snapshotData) =>
            snapshotData.docs.map((e) => PostModel.fromMap(e.data())).toList());
  }
}

// mapping data in Dart
test() {
  List<Map<String, String>> list = [
    {"num": "1"}, //
    {"num": "2"},
    {"num": "3"},
    {"num": "4152"},
    {"num": "51"}
  ];

  List<int> intList =
      list.map((e) => int.parse(e['num']!)).toList(); //=> [1, 2, 3, 4152, 51];
}
