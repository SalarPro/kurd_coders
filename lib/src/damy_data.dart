/* 

User: 
1- userID
2- Name
3- Bio
4- username
5- Email
6- Password
7- profile picture 
8- birthday 

Post:
1- text
2- image (optional)
3- id, 
4- userID
5- createDate

 */

import 'package:kurd_coders/src/models/comment_model.dart';
import 'package:kurd_coders/src/models/post_model.dart';
import 'package:kurd_coders/src/models/user_model.dart';

UserModel get myUser => UserModel(
      id: "1",
      avatarUrl:
          "https://media.sketchfab.com/models/624acae4597c40eb90aebc2650bc99bf/thumbnails/09e3261cc6204116b5fc611acb4eda6d/f4957ec96b79488298ec52c245986898.jpeg",
      bio: "Flutter app developer",
      birthday: DateTime(1997, 3, 30),
      email: "inmfo@salaropro.con",
      name: "Salar Khalid",
      username: "salarpro",
    );

List<PostModel> get myPosts => [
      PostModel(
        id: "1",
        userId: "1",
        text: "My post",
        imageUrl:
            "https://www.highlandsco.com/wp-content/uploads/2015/03/highlands-model-wheel-e1481547764800.jpg",
        comments: [
          CommentModel(
            id: "1",
            comment: "My comment",
            userId: "2",
            createdAt: DateTime(2023, 8, 25, 5, 25),
          ),
          CommentModel(
            id: "1",
            comment: "My comment",
            userId: "2",
            createdAt: DateTime(2023, 8, 25, 5, 25),
          ),
        ],
        likesUserUID: ["1", "2", "10"],
        createdAt: DateTime(2023, 8, 25, 5, 25),
        updateAt: DateTime(2023, 8, 25, 5, 25),
      ),
      PostModel(
        id: "2",
        userId: "1",
        text:
            "My post My post My post My post My post My post My post My post My post My post My post ",
        imageUrl: null,
        comments: [
          CommentModel(
            id: "1",
            comment: "My comment",
            userId: "2",
            createdAt: DateTime(2023, 8, 25, 5, 25),
          ),
          CommentModel(
            id: "1",
            comment: "My comment",
            userId: "2",
            createdAt: DateTime(2023, 8, 25, 5, 25),
          ),
          CommentModel(
            id: "1",
            comment: "My comment",
            userId: "2",
            createdAt: DateTime(2023, 8, 25, 5, 25),
          ),
          CommentModel(
            id: "1",
            comment: "My comment",
            userId: "2",
            createdAt: DateTime(2023, 8, 25, 5, 25),
          ),
        ],
        likesUserUID: [
          "11",
          "22",
          "110",
          "11",
          "22",
          "110",
          "11",
          "112",
          "2210",
          "111",
          "112",
          "2210",
          "111",
          "112",
          "1011"
        ],
        createdAt: DateTime(2023, 8, 25, 5, 25),
        updateAt: DateTime(2023, 8, 25, 5, 25),
      ),
      PostModel(
        id: "2",
        userId: "1",
        text:
            "My post My post My post My post My post My post My post My post My post My post My post ",
        imageUrl:
            "https://www.highlandsco.com/wp-content/uploads/2015/03/highlands-model-wheel-e1481547764800.jpg",
        comments: [
          CommentModel(
            id: "1",
            comment: "My comment",
            userId: "2",
            createdAt: DateTime(2023, 8, 25, 5, 25),
          ),
        ],
        likesUserUID: [],
        createdAt: DateTime(2023, 8, 25, 5, 25),
        updateAt: DateTime(2023, 8, 25, 5, 25),
      ),
      PostModel(
        id: "2",
        userId: "1",
        text:
            "My post My post My post My post My post My post My post My post My post My post My post ",
        imageUrl:
            "https://www.highlandsco.com/wp-content/uploads/2015/03/highlands-model-wheel-e1481547764800.jpg",
        comments: [
          CommentModel(
            id: "1",
            comment: "My comment",
            userId: "2",
            createdAt: DateTime(2023, 8, 25, 5, 25),
          ),
        ],
        likesUserUID: [],
        createdAt: DateTime(2023, 8, 25, 5, 25),
        updateAt: DateTime(2023, 8, 25, 5, 25),
      ),
      PostModel(
        id: "2",
        userId: "1",
        text:
            "My post My post My post My post My post My post My post My post My post My post My post ",
        imageUrl:
            "https://www.highlandsco.com/wp-content/uploads/2015/03/highlands-model-wheel-e1481547764800.jpg",
        comments: [
          CommentModel(
            id: "1",
            comment: "My comment",
            userId: "2",
            createdAt: DateTime(2023, 8, 25, 5, 25),
          ),
        ],
        likesUserUID: [],
        createdAt: DateTime(2023, 8, 25, 5, 25),
        updateAt: DateTime(2023, 8, 25, 5, 25),
      ),
    ];

/* 
List<Map<String, dynamic>> posts = [
  {
    "id": "1",
    "userID": "1",
    "text": "Hello",
    "image":
        "https://www.highlandsco.com/wp-content/uploads/2015/03/highlands-model-wheel-e1481547764800.jpg",
    "createDate": DateTime(2023, 8, 25, 5, 25),
    "likesCount": [
      "1",
      "2",
      "2",
      "2",
      "2",
      "3",
    ],
    "comments": [
      {"userID": "1", "comment": "Nice"},
      {"userID": "1", "comment": "GOOD WORK"},
      {"userID": "1", "comment": "Good"},
    ]
  },
  {
    "id": "2",
    "userID": "1",
    "text": "Hello",
    "image": null,
    "createDate": DateTime(2023, 8, 25, 5, 25),
    "likesCount": [
      "1",
      "2",
      "3",
      "1",
      "2",
      "3",
      "1",
      "2",
      "3",
    ],
    "comments": [
      {"userID": "1", "comment": "Nice"},
      {"userID": "1", "comment": "GOOD WORK"},
      {"userID": "1", "comment": "Good"},
      {"userID": "1", "comment": "GOOD WORK"},
      {"userID": "1", "comment": "Good"},
    ]
  },
  {
    "id": "3",
    "userID": "1",
    "text": "Hello",
    "image":
        "https://www.highlandsco.com/wp-content/uploads/2015/03/highlands-model-wheel-e1481547764800.jpg",
    "createDate": DateTime(2023, 8, 25, 5, 25),
    "likesCount": [
      "1",
      "2",
      "3",
      "1",
      "2",
      "3",
      "1",
      "2",
      "3",
      "1",
      "2",
      "3",
    ],
    "comments": [
      {
        "userID": "1",
      },
    ]
  },
];
 */
