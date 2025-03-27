import 'dart:math';

import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/App%20title%20and%20logo/app_title-watchstylo.dart';
import 'package:watches_ecommerce_/Navigation%20Style/navigatoion.animation.dart';
import 'package:watches_ecommerce_/Second%20Login%20page/second_main_login_page.dart';
import 'package:watches_ecommerce_/UI%20helper/my_main_button.dart';
import 'package:watches_ecommerce_/animated%20logo/animated-logo.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> rotationIMG;
  late Animation<Offset> slidingIMG;

  late Animation<Offset> slidingTITLE;
  late Animation<Offset> slidingBUTTON;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    rotationIMG = Tween<double>(begin: 0.0, end: 0.6365 * pi).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.0, 0.3)),
    );

    slidingIMG = Tween<Offset>(
      begin: Offset(0.0, -5),
      end: Offset(0.0, -0.6),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.0, 0.3)),
    );

    slidingTITLE = Tween<Offset>(
      begin: Offset(1, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.3, 0.6)),
    );

    slidingBUTTON = Tween<Offset>(
      begin: Offset(0.0, 20),
      end: Offset(0.0, 5),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.6, 1.0)),
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
    var mqSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: slidingIMG,
          child: RotationTransition(
            turns: rotationIMG,
            child: AnimatedLogo(begin: 0.9, end: 1.5),
          ),
        ),

        SlideTransition(position: slidingTITLE, child: apptitle(context)),

        SlideTransition(
          position: slidingBUTTON,
          child: myButton(
            buttonText: 'Get Started →',
            onPressed: () {
              navigationPUSHStyle(context, SecondPageLogin());
            },
            context,
          ),
        ),
        
      ],
    );
  }
}
