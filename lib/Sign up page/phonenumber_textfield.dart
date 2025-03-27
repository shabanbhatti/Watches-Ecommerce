import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

class PhoneNumberTextField extends StatefulWidget {
  PhoneNumberTextField({super.key, required this.controller, required this.formKey, required this.focusNode, required this.onFocusSubmitted});

  TextEditingController controller;
  var formKey;
  FocusNode focusNode;
  void Function(String)? onFocusSubmitted;

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  
  
  

  @override
  Widget build(BuildContext context) {
    
    var mqSize = MediaQuery.of(context).size;
    return Form(
      key: widget.formKey,
      
      child: SizedBox(
        width: mqSize.width * 0.9,
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFocusSubmitted,
          validator: (value) {
            if (widget.controller.text.isEmpty) {
              return 'Field should not be empty';
            } else if (value!.length < 11) {
              return 'Must be in 12 digits';
            }
            return null;
          },
          controller: widget.controller,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: 'Enter your phone number',
            prefixIcon: Icon(Icons.phone),
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
