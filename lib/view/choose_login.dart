
import 'package:flutter/material.dart';
import 'package:food_order_system/view/login_screen.dart';
import 'package:food_order_system/view/signup_screen.dart';

class ChooseLogin extends StatelessWidget{
  ChooseLogin({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const Spacer(),

              Image.asset("lib/util/loading_screen_util/logo_image.png"),

              const Text(
                "Hello!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                child: Text(
                  "Welcome to the Diamond Fork app, \nplease set up the account to use",
                  style: TextStyle(
                    color: Colors.grey,
                    
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              CustomButton(
                height: 50,
                width: 250,
                buttonColor: Color.fromARGB(255, 5, 59, 80),
                buttonBorderColor: Color.fromARGB(255, 5, 59, 80),
                buttonText: "Login",
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),

              CustomButton(
                height: 50,
                width: 250,
                buttonColor: Colors.white,
                buttonBorderColor: Color.fromARGB(255, 5, 59, 80),
                buttonText: "Sign up",
                textColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignupScreen())
                  );
                },
              ),

              


              const Spacer(),
            ],
          ),
        ),
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