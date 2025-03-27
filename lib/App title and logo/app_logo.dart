import 'package:flutter/material.dart';

Widget appLogo(
  BuildContext context, {
  double mqSizeHeight = 0.2,
  double mqSizeWidth = 0.5,
}) {
  var mqSize = MediaQuery.of(context).size;
  return Image.asset(
    'assets/images/watchlogo.png',
    height: mqSize.height * mqSizeHeight,
    width: mqSize.width * mqSizeWidth,
    fit: BoxFit.fitHeight,
  );
}
