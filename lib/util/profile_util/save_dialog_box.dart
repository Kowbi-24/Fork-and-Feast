import 'package:flutter/material.dart';

class SaveDialogBox extends StatelessWidget {
  bool successful;
  SaveDialogBox({super.key, required this.successful});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //backgroundColor: Colors.white,
      title: successful ? Text('Success') : Text("Invalid"),
      content: successful ? Text('Your profile information has been successfully updated.') : Text("The email you provided is already taken. Choose another"),
      actions: [
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
