// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kurd_coders/src/constants/assets.dart';
import 'package:kurd_coders/src/login_screen/login_screen.dart';
import 'package:kurd_coders/src/my_widgets/k_text_filed.dart';

class EditPRofileScreen extends StatefulWidget {
  const EditPRofileScreen({super.key});

  @override
  State<EditPRofileScreen> createState() => _EditPRofileScreenState();
}

class _EditPRofileScreenState extends State<EditPRofileScreen> {
  var birthdayTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: _appBar,
      body: _body,
    );
  }

  get _body => SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey.shade400,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(1, 3), // changes position of shadow
                    ),
                  ],
                  color: Color(0xffF9E995),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Select image ",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 15),
                    Image.asset(
                      Assets.resourceIconsAddImage,
                      width: 22,
                      height: 22,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: 16, left: 25, bottom: 0, top: 5),
                    child: Text("BIO"),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: 16, left: 16, bottom: 16, top: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(1, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: TextEditingController(
                          text:
                              "A box shadow is a visual effect used in the Flutter framework that lets you add shadows to any widget. It is a built-in widget that takes ets you add shadows to any widget. It is a built-in widget that takes",
                        ),
                        decoration: InputDecoration(border: InputBorder.none),
                        maxLines: 5,
                        maxLength: 255,
                      ),
                    ),
                  ),
                ],
              ),
              KTextField(
                title: "Name",
                hint: 'Full name',
                controller: TextEditingController(text: "Karam Zeway"),
              ),
              KTextField(
                title: "Username",
                hint: 'karamzeway',
                icon: Assets.resourceIconsAt,
              ),
              KTextField(
                isEnable: false,
                title: "Email",
                hint: 'name@example.com',
                controller: TextEditingController(text: "info@test.com"),
                icon: Assets.resourceIconsMail,
              ),
              // Bo chi l vere Row qabil naket
              KTextField(
                title: 'Birthday',
                hint: '1990/05/01',
                controller: birthdayTEC,
                icon: Assets.resourceIconsBirthday,
                onTap: () {
                  pickDate();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(1, 3), // changes position of shadow
                    ),
                  ],
                  color: Color(0xff64A09A),
                  borderRadius: BorderRadius.all(
                    Radius.circular(13),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Save ",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(width: 15),
                    Image.asset(
                      Assets.resourceIconsSave,
                      color: Colors.white,
                      scale: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  // TOD show alert to confirm logout
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
                },
                child: Container(
                  width: 200,
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(1, 3), // changes position of shadow
                      ),
                    ],
                    color: Color.fromARGB(255, 92, 5, 5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Save ",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(width: 15),
                      Image.asset(
                        Assets.resourceIconsSave,
                        color: Colors.white,
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      );

  get _appBar => AppBar(
        leading: _appBarBackIcon,
        leadingWidth: 70,
        backgroundColor: Colors.grey.shade400,
        actions: [
          _appBarSaveIcon,
        ],
      );

  get _appBarSaveIcon => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xff64A09A),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(1, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              Assets.resourceIconsSave,
              width: 22,
              height: 22,
            ),
          ),
        ),
      );

  get _appBarBackIcon => Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                Assets.resourceIconsLeftArrow,
                width: 22,
                height: 22,
              ),
              Text(
                "Bcak",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      );

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: DateTime.now().subtract(
          Duration(
            milliseconds: 31556926000 * 13,
          ),
        ),
        firstDate:
            DateTime.now().subtract(Duration(milliseconds: 31556926000 * 100)),
        lastDate: DateTime.now().subtract(
          Duration(
            milliseconds: 31556926000 * 13,
          ),
        ));

    if (pickedDate != null) {
      print(pickedDate);

      birthdayTEC.text = DateFormat("yyyy/MM/d HH:mm aa").format(pickedDate);
      setState(() {});
    } else {}
  }
}

/* 
test() {
  // only for Learning
  String? name;

  var ar1 = [
    1,
    if (name != null) 2,
    if (name != null) 3,
    if (name != null) 4,
  ];

  var ar1_v2 = [
    1,
    if (name != null) ...[
      2,
      3,
      4,
    ]
  ];

  var arr2 = [546, 654, 6541];

  List<int> mArr = [45, ...ar1];

  List<int> mArr2 = [
    45,
    if (name == "computer") ...[1, 2, 3, 4, 5],
  ];

  print(mArr2); // 45,1,2,3,4,5

  List<int> mArr3 = [
    45,
    if (name == "laptop") ...[1, 2, 3, 4, 5],
  ];

  print(mArr2); // 45
}
 */
