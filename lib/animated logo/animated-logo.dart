import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/App%20title%20and%20logo/app_logo.dart';
import 'package:watches_ecommerce_/Second%20Login%20page/Text%20Form%20Field/email_textformfield.dart';

class AnimatedLogo extends StatefulWidget {
   AnimatedLogo({super.key, required this.begin, required this.end});
double begin;
double end;
  @override
  State<AnimatedLogo> createState() => _SecondPageLoginState();
}

class _SecondPageLoginState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleIMG;

  void foo() {
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    foo();
    scaleIMG = Tween<double>(begin: widget.begin, end: widget.end).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceIn),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return ScaleTransition(scale: scaleIMG, child: appLogo(context));
  }
}
