import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

class NameTextfield extends StatefulWidget {
  NameTextfield({
    super.key,
    required this.controller,
    required this.formKey,
    required this.focusNode,
    required this.onFocusSubmitted,
  });

  TextEditingController controller;
  var formKey;
  FocusNode focusNode;
  void Function(String)? onFocusSubmitted;

  @override
  State<NameTextfield> createState() => _NameTextfieldState();
}

class _NameTextfieldState extends State<NameTextfield> {
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
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[A-z a-z]')),
          ],
          validator: (value) {
            if (widget.controller.text.isEmpty) {
              return 'Field should not be empty';
            }
            return null;
          },
          controller: widget.controller,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: 'Enter your full name',
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
    );
  }
}
