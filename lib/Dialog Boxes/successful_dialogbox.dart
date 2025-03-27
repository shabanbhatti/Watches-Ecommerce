import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/UI%20helper/my_main_button.dart';
import 'package:watches_ecommerce_/UI%20helper/my_text_style.dart';

void successDialogBox(BuildContext context, String message) {
  showDialog(
    barrierColor: Colors.grey.withAlpha(80),
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 50),
            SizedBox(width: 10),
            Text(
              "Success",
              style: myTextStyle(context, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        content: Text(message),
        actions: [
          myButton(
            context,
            buttonText: 'ok',
            onPressed: () {
              Navigator.of(context).pop();
            },
            buttonMqWidth: 0.2,
          ),
        ],
      );
    },
  );
}
