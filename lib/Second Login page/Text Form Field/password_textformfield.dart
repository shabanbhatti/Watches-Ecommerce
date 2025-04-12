import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    super.key,
    required this.controller,
    required this.formKey,
    required this.focusNode,
    this.onFocusSubmitted,
  });

  TextEditingController controller;
  var formKey;
  FocusNode focusNode;
  void Function(String)? onFocusSubmitted;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Form(
      key: widget.formKey,
      
      child: SizedBox(
        width: mqSize.width * 0.9,
        child: TextFormField(
          onFieldSubmitted: widget.onFocusSubmitted,
          focusNode: widget.focusNode,
          obscureText: isObscure,
          validator: (value) {
            if (widget.controller.text.isEmpty) {
              return 'Field should not be empty';
            } else if (!RegExp('[A-Z]').hasMatch(value!)) {
              return 'Must contains upper case letters';
            }else if (!RegExp('[a-z]').hasMatch(value)) {
              return 'Must contains lower case letters';
            } else if (!RegExp('[0-9]').hasMatch(value)) {
              return 'Must contains numeric digits';
            } else if (value.length <= 10) {
              return 'Must be at least 10 digits';
            }
            return null;
          },
          controller: widget.controller,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: 'Enter your password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon:


                (isObscure == true)
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = false;
                        });
                      },
                      icon: Icon(Icons.visibility),
                    )
                    : IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = true;
                        });
                      },
                      icon: Icon(Icons.visibility_off),
                    ),
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
    );
  }
}
