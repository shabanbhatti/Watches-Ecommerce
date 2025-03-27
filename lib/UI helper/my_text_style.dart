import 'package:flutter/material.dart';

TextStyle myTextStyle(BuildContext context, {double fontSize =30, FontWeight fontWeight= FontWeight.bold}){
  return TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary);
}