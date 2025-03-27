import 'package:flutter/material.dart';

class AnimatedWatches extends StatefulWidget {
  AnimatedWatches({
    super.key,
    required this.begin,
    required this.end,
    required this.watchImgName,
  });
  double begin;
  double end;
  String watchImgName;
  @override
  State<AnimatedWatches> createState() => _AnimatedWatchesState();
}

class _AnimatedWatchesState extends State<AnimatedWatches>
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
      duration: Duration(milliseconds: 500),
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
    var mqSize = MediaQuery.of(context).size;

    return ScaleTransition(
      scale: scaleIMG,
      child: Image.asset(
        'assets/images/${widget.watchImgName}.png',
        height: mqSize.height * 0.3,
        width: mqSize.width * 0.6,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
