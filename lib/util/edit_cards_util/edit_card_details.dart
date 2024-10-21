import 'package:flutter/material.dart';

class EditCardDetails extends StatelessWidget {

  TextEditingController cardNumberController;
  TextEditingController cardHolderNameController;
  TextEditingController expirationDateController;
  TextEditingController cardTypeController;

  EditCardDetails({
    super.key,
    required this.cardNumberController,
    required this.cardHolderNameController,
    required this.expirationDateController,
    required this.cardTypeController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0 ,left: 30.0, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InputBox(inputMessage: "Card Number", textHint: "Enter your 16 digit number", isHidden: false, controller: cardNumberController, inputMessageColor: Colors.black),
            InputBox(inputMessage: "Card Holder Name", textHint: "Enter your name", isHidden: false, controller: cardHolderNameController, inputMessageColor: Colors.black),
            InputBox(inputMessage: "Expiration Date", textHint: "DD/MM/YY", isHidden: false, controller: expirationDateController, inputMessageColor: Colors.black),
            InputBox(inputMessage: "Card Type", textHint: "Enter card type", isHidden: false, controller: cardTypeController, inputMessageColor: Colors.black)
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
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
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
          SizedBox(height: 5,),
          Container(
            height: 60,
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

