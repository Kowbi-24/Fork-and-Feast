import 'package:flutter/material.dart';
import 'package:food_order_system/model/user.dart';
import 'package:food_order_system/view/home_page.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';

import 'package:food_order_system/model/boxes.dart';

class LoginScreen extends StatefulWidget{
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen>{

  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Color usernameColor = Colors.black;
  Color passwordColor = Colors.black;

  Widget build(BuildContext context){
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
              "LOGIN",
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
            
        
            InputBox(inputMessage: "Email", textHint: "", isHidden: false,inputMessageColor: usernameColor ,controller: emailContoller,),
            InputBox(inputMessage: "Password", textHint: "", isHidden: true,inputMessageColor: passwordColor ,controller: passwordController,),

            SizedBox(height: 100,),

            CustomButton(
                height: 50,
                width: 250,
                buttonColor: Color.fromARGB(255, 5, 59, 80),
                buttonBorderColor: Color.fromARGB(255, 5, 59, 80),
                buttonText: "Confirm",
                textColor: Colors.white,
                onPressed: () {
                  String correctPassword = "";
                  int? id;
        
                  // Get the correct password
                  for (User user in userBox.values){
                    if (emailContoller.text == user.email){
                      id = user.id;
                      correctPassword = user.password;
                      print("====== CORRECT PASSWORD: $correctPassword ============");
                    }
                  }
        
                  bool validUserName = emailContoller.text.isNotEmpty;
                  bool validPassword = passwordController.text.isNotEmpty & (passwordController.text == correctPassword);
        
                  if (validUserName & validPassword){
                    currentUser = userBox.get("key_$id");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
        
                  if (!validUserName){
                    setState(() {
                      usernameColor = Colors.red;
                    });
                  }else{
                    setState(() {
                      usernameColor = Colors.black;
                    });
                  }
        
                   if (!validPassword){
                    setState(() {
                      passwordColor = Colors.red;
                    });
                  }else{
                    setState(() {
                      passwordColor = Colors.black;
                    });
                  }
                },
              ),                
          ],
        ),
      ),
    );
  }
}

class InputBox extends StatelessWidget{

  final String inputMessage;
  final String textHint;
  final bool isHidden;
  final Color inputMessageColor;
  final TextEditingController controller;

  InputBox({
    super.key,
    required this.inputMessage,
    required this.textHint,
    required this.isHidden,
    required this.inputMessageColor,
    required this.controller,
  });

  @override
  Widget build(BuildContext context){
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
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}



class CustomButton extends StatelessWidget{

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
  Widget build(BuildContext context){
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
            style: TextStyle(
              color: textColor,
              fontSize: 15
            ),
          ),
        ),
      ),
    );
  }
}