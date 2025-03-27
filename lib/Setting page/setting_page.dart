import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watches_ecommerce_/Navigation%20Style/navigatoion.animation.dart';
import 'package:watches_ecommerce_/Setting%20page/circle_avatar.dart';
import 'package:watches_ecommerce_/Setting%20page/list_tile.dart';
import 'package:watches_ecommerce_/Setting%20page/next_page_for_listtile.dart';
import 'package:watches_ecommerce_/UI%20helper/my_main_button.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  File? file;

  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickingImage(ImageSource imageSource) async {
    try {
      XFile? pickedFile = await imagePicker.pickImage(source: imageSource);

      if (pickedFile != null) {
        setState(() {
          file = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Not workin $e');
    }
  }

  void myPickingImgDialogBox() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      pickingImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.camera_alt, size: 30),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      pickingImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.photo, size: 30),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: myButton(
                      buttonText: 'Cancel',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      context,
                      buttonMqWidth: 0.3,
                    ),
                  ),
                ),
                Flexible(
                  child: myButton(
                    buttonText: 'Ok',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    buttonMqWidth: 0.3,
                    context,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  String userName = 'No Username';
  var setUsernameController = TextEditingController();

  @override
  void dispose() {
    setUsernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mqSize.height * 0.05),
            circleAvatar(
              context,
              backgroundImage: (file != null) ? FileImage(file!) : null,
              onPressed: () {
                myPickingImgDialogBox();
              },
            ),
            SizedBox(height: mqSize.height * 0.02),

            Text(
              (setUsernameController.text.isEmpty)
                  ? userName
                  : setUsernameController.text,
              style: TextStyle(
                color:
                    (setUsernameController.text.isEmpty)
                        ? Colors.grey
                        : Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: mqSize.height * 0.05),
            myListTile(
              title: 'Set username',
              leadingIcon: Icons.person,
              onTab: () {
                navigationPUSHStyle(
                  context,
                  NextPageForListtile(
                    appTitle: 'Set Username',
                    controller: setUsernameController,
                  ),
                );
              },
            ),
            SizedBox(height: mqSize.height * 0.02),
            myListTile(
              title: 'Change email',
              leadingIcon: Icons.mail,
              onTab: () {},
            ),
            SizedBox(height: mqSize.height * 0.02),
            myListTile(
              title: 'Change password',
              leadingIcon: Icons.lock,
              onTab: () {},
            ),
            SizedBox(height: mqSize.height * 0.02),
            myListTile(
              title: 'Advance settings',
              leadingIcon: Icons.settings,
              onTab: () {},
            ),
            SizedBox(height: mqSize.height * 0.02),
            myListTileLogOut(
              title: 'Log out',
              leadingIcon: Icons.logout,
              onTab: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
