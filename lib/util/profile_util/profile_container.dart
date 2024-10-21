import 'package:flutter/material.dart';
import 'package:food_order_system/util/profile_util/custom_circle_avatar.dart';

class ProfileContainer extends StatelessWidget {
  final String? userName;
  final String? userPhoneNo;
  final String? userEmail;
  final String userProfilePicture;

  // Constructors
  const ProfileContainer({
    Key? key,
    required this.userName,
    required this.userPhoneNo,
    required this.userEmail,
    required this.userProfilePicture,
  }) : super(key: key);

  ProfileContainer.withPicture({
    Key? key,
    required this.userProfilePicture,
  })  : userName = null,
        userPhoneNo = null,
        userEmail = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Material(
        color: Color.fromARGB(255, 5, 59, 80),
        elevation: 5,
        child: Container(
          //color: Color.fromARGB(255, 23, 107, 135),
          height: 250,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CustomCircleAvatar(
                        widthSize: 120,
                        heightSize: 120,
                        userProfilePicture: userProfilePicture,
                      ),
                    ),

                    if (userName != null) Text(
                      '$userName',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                    SizedBox(height: 8),
                    if (userName != null) Text(
                      '$userPhoneNo',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    if (userName != null) Text(
                      '$userEmail',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}