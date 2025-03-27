import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

class EmailTextField extends StatefulWidget {
  EmailTextField({super.key, required this.controller, required this.formKey, required this.focusNode, required this.onFocusSubmitted});

  TextEditingController controller;
  var formKey;
  FocusNode focusNode;
  void Function(String)? onFocusSubmitted;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  String emailValidation = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}';
  
  

  @override
  Widget build(BuildContext context) {
    
    var mqSize = MediaQuery.of(context).size;
    return Form(
      key: widget.formKey,
      
      child: SizedBox(
        width: mqSize.width * 0.9,
        child: TextFormField(
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFocusSubmitted,
          validator: (value) {
            if (widget.controller.text.isEmpty) {
              return 'Field should not be empty';
            } else if (!RegExp(emailValidation).hasMatch(widget.controller.text)) {
              return 'Invalid context of email';
            }
            return null;
          },
          controller: widget.controller,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: 'Enter your email',
            prefixIcon: Icon(Icons.mail),
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
    );
  }
}
