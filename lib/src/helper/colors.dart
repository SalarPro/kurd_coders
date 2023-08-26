import 'package:flutter/material.dart';

class KColors {
  static const Color primaryColor = Color.fromARGB(255, 247, 150, 5);
  static const Color successColor = Color.fromARGB(255, 35, 164, 28);

  static const mainColor = Color.fromARGB(255, 226, 89, 89);

  static MaterialColor get text => const MaterialColor(0xff505862, {
        50: Color(0xffffffff),
        100: Color(0xffF7F6F5),
        200: Color.fromARGB(255, 208, 255, 235),
        300: Color(0xff727c8e),
        400: Color(0xff727C8E),
        500: Color(0xff545454),
        600: Color(0xff002042),
        700: Color(0xff002042),
        800: Color(0xff002042),
        900: Color(0xff002042),
      });
}
