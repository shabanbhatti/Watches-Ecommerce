import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

Widget myButton(
  BuildContext context, {
  required String buttonText,
  required void Function() onPressed,
  double buttonMqWidth =0.39
}) {
  var mqSize = MediaQuery.of(context).size;
  return SizedBox(
    width: mqSize.width * buttonMqWidth,
    child: OutlinedButton(
      
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: myColor, width: 2),
        // backgroundColor: Colors.grey.withAlpha(50),
        backgroundColor: myColor,
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        softWrap: true,
        style: TextStyle(
          color: Colors.white,
          //  Theme.of(context).scaffoldBackgroundColor
        ),
      ),
    ),
  );
}
