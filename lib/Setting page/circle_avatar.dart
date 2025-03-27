import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

Widget circleAvatar(
  BuildContext context, {
  required ImageProvider<Object>? backgroundImage,
  required void Function()? onPressed,
}) {
  var mqSize = MediaQuery.of(context).size;

  return Container(
    color: Colors.transparent,
    height: mqSize.height * 0.25,
    width: mqSize.width * 0.65,

    child: Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            radius: 150,
            backgroundColor: Colors.grey[300],
            backgroundImage: backgroundImage,
            // backgroundImage: _image != null ? FileImage(_image!) : null,
            // child:
            //     _image == null
            //         ? Icon(
            //           Icons.person,
            //           size: 60,
            //           color: Colors.grey[700],
            //         )
            //         : null,
          ),
        ),
        Align(
          alignment: Alignment(0.8, 0.8),
          child: Container(
            height: mqSize.height * 0.07,
            width: mqSize.width * 0.16,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(100),
            ),

            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                icon: Icon(
                  CupertinoIcons.pencil_circle_fill,
                  size: 50,
                  color: myColor,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  // return Container(
  //   height: mqSize.height * 0.25,
  //   width: mqSize.width * 0.65,
  //   color: Colors.transparent,
  //   child: Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       CircleAvatar(
  //         radius: 150,
  //         backgroundImage: AssetImage('assets/images/watchwallpaper.jpg'),
  //       ),
  //       Icon(CupertinoIcons.pencil_circle_fill, size: 40, color: Colors.white),
  //     ],
  //   ),
  // );
}
