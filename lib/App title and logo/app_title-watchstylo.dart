import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';
import 'package:watches_ecommerce_/UI%20helper/my_text_style.dart';

Widget apptitle(BuildContext context, ) {
  
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('ᗯᗩTᑕᕼ', style: myTextStyle(context)),
      Text(
        ' 𝙎',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: myColor,
        ),
      ),
      Text('TYᒪO', style: myTextStyle(context,)),
    ],
  );
}


Widget apptitleForHomeScreens(BuildContext context,{double fontSize =30}) {
  
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('ᗯᗩTᑕᕼ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: Colors.white)),
      Text(
        ' 𝙎',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: myColor,
        ),
      ),
      Text('TYᒪO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: Colors.white)),
    ],
  );
}
