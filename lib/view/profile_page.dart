import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_order_system/controller/controller.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/view/choose_login.dart';
import 'package:food_order_system/view/home_page.dart';

import 'package:food_order_system/util/back_arrow_icon.dart';
import 'package:food_order_system/util/profile_util/custom_circle_avatar.dart';
import 'package:food_order_system/util/profile_util/edit_list_button.dart';
import 'package:food_order_system/util/profile_util/profile_container.dart';

import 'package:food_order_system/view/edit_profile_page.dart';
import 'package:food_order_system/view/edit_cards_page.dart';

class ProfilePage extends StatefulWidget {

  String userName = currentUser.name;
  String userPhoneNo = currentUser.phoneNum;
  String userEmail = currentUser.email;
  String userProfilePicture = currentUser.imgPath;
  String userPassword = currentUser.password;


  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    final List _pages = [
      // Edit Profile Page
      EditProfilePage(
          userProfilePicture: widget.userProfilePicture,
      ),
      // Edit Cards Page (temporary)
      EditCardsPage(updateCardValues: (){},),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 5, 59, 80),
        leading: BackArrowIcon(
          backgroundColor: Colors.white,
          iconColor: Color.fromARGB(255, 5, 59, 80),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "PROFILE",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      //body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          ProfileContainer(
            userName: widget.userName,
            userPhoneNo: widget.userPhoneNo,
            userEmail: widget.userEmail,
            userProfilePicture: widget.userProfilePicture,
          ),
          SizedBox(height: 20.0,),
      
          // Edit Profile Button
          EditListButton(
            text: "Edit Profile",
            onPressed: () {
              // Navigate to Profile Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _pages[0]),
              );
            },
          ),
          SizedBox(height: 20.0,),
      
          // Edit Card Button
          EditListButton(
            text: "Edit Cards",
            onPressed: () {
              // Navigate Edit Card Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _pages[1]),
              );
            },
          ),

          SizedBox(height: 20.0,),

          // Delete account button
          EditListButton(
            text: "Delete Account",
            onPressed: () {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Are you sure?"),
        content: Text("Do you really want to delete this user? This action cannot be undone."),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
                          // Close the dialog without doing anything
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("Yes"),
                        onPressed: () {
                          // Perform the action and close the dialog
                          Navigator.of(context).pop(); // Close the dialog

                          // Navigate to the next page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseLogin()),
                          );

                          // Delete the user
                          Controller().deleteUser(currentUser);
                        },
                      ),
                    ],
                  );
                },
              );
            },

          ),
        ],
      ),
    );
  }
}
