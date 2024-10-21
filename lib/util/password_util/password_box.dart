import 'package:flutter/material.dart';

class ChangePasswordBox extends StatelessWidget {

  TextEditingController oldPasswordController;
  TextEditingController newPasswordController;
  TextEditingController confirmNewPasswordController;

  ChangePasswordBox({
    super.key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmNewPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0 ,left: 30.0, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:EdgeInsets.all(15),
              child: TextField(
                controller: oldPasswordController,
                obscureText:true,
                decoration:
                InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Old Password',
                    hintText: 'Enter Your Old Password'
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.all(15),
              child: TextField(
                controller: newPasswordController,
                obscureText:true,
                decoration:
                InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New Password',
                    hintText: 'Enter Your New Password'
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.all(15),
              child: TextField(
                controller: confirmNewPasswordController,
                obscureText:true,
                decoration:
                InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm New Password',
                    hintText: 'Confirm Your New Password'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
