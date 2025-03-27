import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/App%20title%20and%20logo/app_title-watchstylo.dart';
import 'package:watches_ecommerce_/bottom_navigation.dart';
import 'package:watches_ecommerce_/Navigation%20Style/navigatoion.animation.dart';
import 'package:watches_ecommerce_/Second%20Login%20page/Text%20Form%20Field/email_textformfield.dart';
import 'package:watches_ecommerce_/Second%20Login%20page/Text%20Form%20Field/password_textformfield.dart';
import 'package:watches_ecommerce_/Sign%20up%20page/sign_up_main.dart';
import 'package:watches_ecommerce_/UI%20helper/my_main_button.dart';
import 'package:watches_ecommerce_/animated%20logo/animated-logo.dart';

class SecondPageLogin extends StatefulWidget {
  const SecondPageLogin({super.key});

  @override
  State<SecondPageLogin> createState() => _SecondPageLoginState();
}

class _SecondPageLoginState extends State<SecondPageLogin> {
  //  -------EMAIL Portion--------
  TextEditingController emailController = TextEditingController();
  var emailFormKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();

  // --------Password Portion-----
  TextEditingController passwordController = TextEditingController();
  var passwordFormKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = FocusNode();

@override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: mqSize.height * 0.1),
              AnimatedLogo(begin: 0.7, end: 1.0),
              SizedBox(height: mqSize.height * 0.05),
              apptitle(context),
              SizedBox(height: mqSize.height * 0.05),
              EmailTextField(
                controller: emailController,
                formKey: emailFormKey,
                focusNode: emailFocusNode,
                onFocusSubmitted:
                    (p0) =>
                        FocusScope.of(context).requestFocus(passwordFocusNode),
              ),
              SizedBox(height: mqSize.height * 0.05),
              PasswordTextField(
                controller: passwordController,
                formKey: passwordFormKey,
                focusNode: passwordFocusNode,
              ),
              SizedBox(height: mqSize.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  myButton(
                    context,
                    buttonText: 'Login',
                    buttonMqWidth: 0.3,
                    onPressed: () {
                     var isEmailTrue= emailFormKey.currentState!.validate();
                      var isPasswordTrue =passwordFormKey.currentState!.validate();
                      if (isEmailTrue==true && isPasswordTrue==true) {
                        navigationPUSHStyle(context, BottomNavigationBarPage());
                      }
                    },
                  ),
                  myButton(
                    context,
                    buttonText: 'Sign up',
                    buttonMqWidth: 0.3,
                    onPressed: () {
                      navigationPUSHStyle(context, SignUpPage());
                    },
                  ),
                ],
              ),
              SizedBox(height: mqSize.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.apple, size: 40),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook, size: 40, color: Colors.blue),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/google.png',
                      height: mqSize.height * 0.035,
                      width: mqSize.width * 0.078,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
