import 'dart:math';
import 'package:flutter/material.dart';
import 'package:food_order_system/controller/controller.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/model/user.dart';
import 'package:food_order_system/view/home_page.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';

class SignupScreen extends StatefulWidget {
  State<StatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Color userNameInputTextColors = Colors.black;
  Color emailInputTextColors = Colors.black;
  Color passwordInputTextColor = Colors.black;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowIcon(
          backgroundColor: Color.fromARGB(255, 5, 59, 80),
          iconColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "SIGNUP",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "lib/util/loading_screen_util/logo_image.png",
              height: 300,
            ),
            InputBox(
              inputMessage: "Username",
              textHint: "",
              isHidden: false,
              controller: usernameController,
              inputMessageColor: userNameInputTextColors,
            ),
            InputBox(
              inputMessage: "Email",
              textHint: "",
              isHidden: false,
              controller: emailController,
              inputMessageColor: emailInputTextColors,
            ),
            InputBox(
              inputMessage: "Password",
              textHint: "",
              isHidden: true,
              controller: passwordController,
              inputMessageColor: passwordInputTextColor,
            ),
            InputBox(
              inputMessage: "Confirm Password",
              textHint: "",
              isHidden: true,
              controller: confirmPasswordController,
              inputMessageColor: passwordInputTextColor,
            ),
            SizedBox(height: 50,),
            CustomButton(
              height: 50,
              width: 250,
              buttonColor: Color.fromARGB(255, 5, 59, 80),
              buttonBorderColor: Color.fromARGB(255, 5, 59, 80),
              buttonText: "Confirm",
              textColor: Colors.white,
              onPressed: () {
                bool validPassword = (passwordController.text == confirmPasswordController.text) && (passwordController.text.isNotEmpty);
                bool validUserName = usernameController.text.isNotEmpty;
                bool validEmail = emailController.text.isNotEmpty;

                print("Email: $validEmail | Name: $validUserName | Password: $validPassword");

                if (validPassword & validUserName & validEmail) {
                  User newUser = User(
                    Controller().generateUserId(),
                    usernameController.text,
                    emailController.text,
                    passwordController.text,
                    "00000000000",
                    "profile_picture.jpg",
                  );
                  if (Controller().addUser(newUser)) {
                    Navigator.pop(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('User Already Exists'),
                          content: Text('The email you are trying to use already has an account. Please try another email.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                }

                setState(() {
                  passwordInputTextColor = validPassword ? Colors.black : Colors.red;
                  userNameInputTextColors = validUserName ? Colors.black : Colors.red;
                  emailInputTextColors = validEmail ? Colors.black : Colors.red;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  final String inputMessage;
  final Color inputMessageColor;
  final String textHint;
  final bool isHidden;
  final TextEditingController controller;

  InputBox({
    super.key,
    required this.inputMessage,
    required this.textHint,
    required this.isHidden,
    required this.controller,
    required this.inputMessageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputMessage,
            style: TextStyle(
              color: inputMessageColor,
              fontWeight: inputMessageColor == Colors.red ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Container(
            height: 40,
            child: TextFormField(
              controller: controller,
              obscureText: isHidden,
              decoration: InputDecoration(
                hintText: textHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  double height;
  double width;
  Color buttonColor;
  Color buttonBorderColor;
  String buttonText;
  Color textColor;
  Function() onPressed;

  CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.buttonColor,
    required this.buttonBorderColor,
    required this.buttonText,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            side: BorderSide(
              width: 1,
              color: buttonBorderColor,
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(color: textColor, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
