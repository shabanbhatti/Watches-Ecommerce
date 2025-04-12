import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedParagraph extends StatefulWidget {
   AnimatedParagraph({super.key, required this.whichWatchParagraph});
String whichWatchParagraph;
  @override
  State<AnimatedParagraph> createState() => _AnimatedParagraphState();
}

class _AnimatedParagraphState extends State<AnimatedParagraph> {
  
  @override
  Widget build(BuildContext context) {
    
    var mqSize = MediaQuery.of(context).size;
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          widget.whichWatchParagraph,
          textStyle: TextStyle(fontSize: 20),
          speed: Duration(milliseconds: 10),
        ),
      ],
      totalRepeatCount: 1,
      displayFullTextOnTap: true,

    );
  }
}
