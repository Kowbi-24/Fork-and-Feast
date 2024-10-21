import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_order_system/controller/controller.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/model/user.dart';
import 'package:food_order_system/view/home_page.dart';
import 'package:food_order_system/view/profile_page.dart';
import 'package:food_order_system/view/settings_page.dart';

import 'package:food_order_system/util/back_arrow_icon.dart';
import 'package:food_order_system/util/profile_util/custom_circle_avatar.dart';
import 'package:food_order_system/util/profile_util/input_list.dart';
import 'package:food_order_system/util/profile_util/edit_list_button.dart';
import 'package:food_order_system/util/profile_util/save_dialog_box.dart';

import 'package:food_order_system/view/change_password_page.dart';

class EditProfilePage extends StatelessWidget {
  String userProfilePicture;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  EditProfilePage({
    Key? key,
    required this.userProfilePicture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Function to create a new user based on the user inputs
    User createNewUser(){
      String name = nameController.text.isNotEmpty ? nameController.text : currentUser.name;
      String phoneNum = phoneNumberController.text.isNotEmpty ? phoneNumberController.text : currentUser.phoneNum;
      String email = emailController.text.isNotEmpty ? emailController.text : currentUser.email;
      String imgPath = currentUser.imgPath;
      String password = currentUser.password;
      
      return User(currentUser.id, name, email, password, phoneNum, imgPath);
    }

    // Code that runs after "SAVE CHANGES" is pressed
    void confirmMessage(){
      User newUser = createNewUser();
      bool successful = Controller().editUser(currentUser.id, newUser, emailController.text.isNotEmpty);

      if (successful) {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
      }

      showDialog(
        context: context,
        builder: (context) {
          return SaveDialogBox(successful: successful,);
        },
      );
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
              "EDIT PROFILE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
      ),

      body:  SingleChildScrollView(
        child: Column(
          children: [
            // Profile Container
            Container(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Center(
                  child: CustomCircleAvatar(
                    widthSize: 180,
                    heightSize: 180,
                    userProfilePicture: userProfilePicture,
                  ),
                ),
              ),
            ),

            // Input List (Name, Phone, Email)
            InputList(nameController: nameController, phoneNumberController: phoneNumberController, emailController: emailController,),
            SizedBox(height: 20.0),

            // Change Password
            EditListButton(
              text: "Change Password",
              onPressed: () {
                // Navigate Change Password Page()
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Color.fromARGB(255, 5, 59, 80),
          ),
          child: Text(
            'Save Changes',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onPressed: confirmMessage,
        ),
      ),
    );
  }
}
