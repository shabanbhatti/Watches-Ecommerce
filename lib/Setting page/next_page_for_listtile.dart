import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watches_ecommerce_/Dialog%20Boxes/successful_dialogbox.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';
import 'package:watches_ecommerce_/UI%20helper/my_main_button.dart';

class NextPageForListtile extends StatefulWidget {
  NextPageForListtile({
    super.key,
    required this.appTitle,
    required this.controller,
  });
  String appTitle;
  TextEditingController controller;
  @override
  State<NextPageForListtile> createState() => _NextPageForListtileState();
}

class _NextPageForListtileState extends State<NextPageForListtile> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text(widget.appTitle)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formkey,

                child: SizedBox(
                  width: mqSize.width * 0.9,
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-z 0-9]')),
                    ],
                    validator: (value) {
                      if (widget.controller.text.isEmpty) {
                        return 'Field should not be empty';
                      } else if (!RegExp('[a-z]').hasMatch(value!)) {
                        return 'Must contains lower case';
                      } else if (value.length <= 7) {
                        return 'Must be in eight letters';
                      }
                      return null;
                    },
                    controller: widget.controller,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'Set your usename',
                      prefixIcon: Icon(Icons.person),
                      suffixIcon:
                          (widget.controller.text.isNotEmpty)
                              ? IconButton(
                                onPressed: () {
                                  widget.controller.clear();
                                },
                                icon: Icon(Icons.close),
                              )
                              : SizedBox(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: myColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: mqSize.height * 0.02),
              myButton(
                context,
                buttonText: 'Save',
                buttonMqWidth: 0.3,
                onPressed: () {
                  var isNameValidateTrue = formkey.currentState!.validate();
                  if (isNameValidateTrue != false) {
                    successDialogBox(context, 'Username set Successfully');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
