import 'package:flutter/material.dart';
import 'package:food_order_system/controller/controller.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/model/user.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';
import 'package:food_order_system/util/password_util/password_box.dart';
import 'package:food_order_system/util/profile_util/save_dialog_box.dart';

class ChangePasswordPage extends StatelessWidget {

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {


    void changePassword(){
      bool oldPasswordCorrect = oldPasswordController.text == currentUser.password;
      bool newPasswordConfirmed = newPasswordController.text == confirmNewPasswordController.text;

      if (oldPasswordCorrect & newPasswordConfirmed){
        String password = newPasswordController.text;
        User newUser = User(currentUser.id, currentUser.name, currentUser.email, password, currentUser.email, currentUser.imgPath);
        Controller().editUser(currentUser.id, newUser, true);
      }
    }


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
              "CHANGE PASSWORD",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
      ),
      body: ChangePasswordBox(oldPasswordController: oldPasswordController, newPasswordController: newPasswordController, confirmNewPasswordController: confirmNewPasswordController,),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Color.fromARGB(255, 5, 59, 80),
          ),
          child: Text(
            'Change Password',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            changePassword();
            showDialog(
              context: context,
              builder: (context) {
                return SaveDialogBox(successful: true,);
              },
            );
          },
        ),
      ),
    );
  }
}

