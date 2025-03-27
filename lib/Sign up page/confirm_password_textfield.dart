import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  ConfirmPasswordTextField({
    super.key,
    required this.controller,
    required this.formKey,

    required this.validator,
  });

  TextEditingController controller;
  var formKey;

  String? Function(String?)? validator;
  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Form(
      key: widget.formKey,

      child: SizedBox(
        width: mqSize.width * 0.9,
        child: TextFormField(
          obscureText: isObscure,
          validator: widget.validator,
          controller: widget.controller,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: 'Confirm Password',
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
