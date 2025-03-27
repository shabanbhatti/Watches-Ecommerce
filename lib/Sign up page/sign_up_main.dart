import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/Dialog%20Boxes/successful_dialogbox.dart';
import 'package:watches_ecommerce_/Second%20Login%20page/Text%20Form%20Field/email_textformfield.dart';
import 'package:watches_ecommerce_/Second%20Login%20page/Text%20Form%20Field/password_textformfield.dart';
import 'package:watches_ecommerce_/Sign%20up%20page/confirm_password_textfield.dart';
import 'package:watches_ecommerce_/Sign%20up%20page/name_textfield.dart';
import 'package:watches_ecommerce_/Sign%20up%20page/phonenumber_textfield.dart';
import 'package:watches_ecommerce_/UI%20helper/my_main_button.dart';
import 'package:watches_ecommerce_/UI%20helper/my_text_style.dart';
import 'package:watches_ecommerce_/animated%20logo/animated-logo.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  //  -------EMAIL Portion--------
  TextEditingController emailController = TextEditingController();
  var emailFormKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();

  //  -------Name Portion--------
  TextEditingController nameController = TextEditingController();
  var nameFormKey = GlobalKey<FormState>();
  FocusNode nameFocusNode = FocusNode();

  //  -------PHONE NUMBER Portion--------
  TextEditingController phoneNumberController = TextEditingController();
  var phoneNumberFormKey = GlobalKey<FormState>();
  FocusNode phoneNumberFocusNode = FocusNode();

  // --------Password Portion-----
  TextEditingController passwordController = TextEditingController();
  var passwordFormKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = FocusNode();

  // --------Confirm Password Portion-----
  TextEditingController confirmPasswordController = TextEditingController();
  var confirmPasswordFormKey = GlobalKey<FormState>();
  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Sign up', style: myTextStyle(context, fontSize: 25)),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: mqSize.height * 0.01),
              AnimatedLogo(begin: 0.7, end: 1.0),
              SizedBox(height: mqSize.height * 0.02),
              EmailTextField(
                controller: emailController,
                formKey: emailFormKey,
                focusNode: emailFocusNode,
                onFocusSubmitted: (p0) {
                  FocusScope.of(context).requestFocus(nameFocusNode);
                },
              ),
              SizedBox(height: mqSize.height * 0.05),
              NameTextfield(
                controller: nameController,
                formKey: nameFormKey,
                focusNode: nameFocusNode,
                onFocusSubmitted: (p0) {
                  FocusScope.of(context).requestFocus(phoneNumberFocusNode);
                },
              ),
              SizedBox(height: mqSize.height * 0.05),
              PhoneNumberTextField(
                controller: phoneNumberController,
                formKey: phoneNumberFormKey,
                focusNode: phoneNumberFocusNode,
                onFocusSubmitted: (p0) {
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
              ),
              SizedBox(height: mqSize.height * 0.05),
              PasswordTextField(
                controller: passwordController,
                formKey: passwordFormKey,
                focusNode: passwordFocusNode,
                onFocusSubmitted: (p0) {
                  FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
                },
              ),
              SizedBox(height: mqSize.height * 0.05),
              ConfirmPasswordTextField(
                controller: confirmPasswordController,
                formKey: confirmPasswordFormKey,
                validator: (value) {
                  if (confirmPasswordController.text.isEmpty) {
                    return 'Field should not be empty';
                  } else if (confirmPasswordController.text !=
                      passwordController.text) {
                    return "Doesn't match to create password";
                  }
                  return null;
                },
              ),
              SizedBox(height: mqSize.height * 0.05),
              myButton(
                context,
                buttonText: 'Save',
                buttonMqWidth: 0.3,
                onPressed: () {
                  var isEmailTrue = emailFormKey.currentState!.validate();
                  var isNameTrue = nameFormKey.currentState!.validate();
                  var isPhoneNumberTrue =
                      phoneNumberFormKey.currentState!.validate();
                  var ispasswordTrue = passwordFormKey.currentState!.validate();
                  var isConfirmPasswordTrue =
                      confirmPasswordFormKey.currentState!.validate();

                  if (isEmailTrue &&
                      ispasswordTrue &&
                      isNameTrue &&
                      isPhoneNumberTrue &&
                      isConfirmPasswordTrue) {
                    successDialogBox(context, 'Added successfully');
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
