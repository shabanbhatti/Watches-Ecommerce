import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/UI%20helper/my_text_style.dart';

void successDialogBox(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
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
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
