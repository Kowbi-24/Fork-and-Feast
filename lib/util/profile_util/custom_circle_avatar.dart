import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double widthSize;
  final double heightSize;
  final String userProfilePicture;

  const CustomCircleAvatar({
    Key? key,
    required this.widthSize,
    required this.heightSize,
    required this.userProfilePicture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSize,
      height: heightSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // Shadow options
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
        // Border options
        border: Border.all(
          color: Colors.white,
          width: 2, // Border width
        ),
      ),
      child: CircleAvatar(
        // Circle options
        radius: 50,
        backgroundImage: AssetImage("lib/images/$userProfilePicture"),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
