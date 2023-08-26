import 'package:flutter/material.dart';
import 'package:kurd_coders/src/helper/colors.dart';
import 'package:kurd_coders/src/helper/text_styles.dart';

class KWidget {
  static btnMeduam({
    String? title,
    String? image,
    Color? color,
    Color? bgColor,
    double? width,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 150,
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
          color: bgColor ?? KColors.primaryColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                title ?? "",
                textAlign: TextAlign.center,
                style: KTextStyle.textColorLight(16).copyWith(
                  color: color ?? KTextStyle.textColorLight(16).color,
                ),
              ),
            ),
            if (image != null)
              Image.asset(
                image,
                width: 22,
                height: 22,
                color: color,
              ),
          ],
        ),
      ),
    );
  }
}
