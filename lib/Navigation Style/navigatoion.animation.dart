import 'package:flutter/material.dart';

void navigationPUSHStyle(BuildContext context, var pushTo) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return pushTo;
      },
      transitionDuration: Duration(milliseconds: 500),
      reverseTransitionDuration: Duration(milliseconds: 500),

      barrierColor: Colors.grey.withAlpha(50),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(scale: animation, child: child);
      },
    ),
  );
}
