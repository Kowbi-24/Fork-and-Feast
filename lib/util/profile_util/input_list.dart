import 'package:flutter/material.dart';
import 'package:food_order_system/controller/controller.dart';

class InputList extends StatelessWidget {

  TextEditingController nameController;
  TextEditingController phoneNumberController;
  TextEditingController emailController;

  InputList({
    super.key,
    required this.nameController,
    required this.phoneNumberController,
    required this.emailController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name:',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                SizedBox(
                  width: 220,
                  child: TextFormField(
                    controller: nameController,
                    //initialValue: userName,
                    decoration: InputDecoration(
                      hintText: 'Edit Name ...',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              color: Colors.black38,
            ),
            SizedBox(height: 10),

            // Phone No. Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone No.:',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                SizedBox(
                  width: 220,
                  child: TextFormField(
                    controller: phoneNumberController,
                    //initialValue: userPhoneNo,
                    decoration: InputDecoration(
                      hintText: 'Edit Phone...',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              color: Colors.black38,
            ),
            SizedBox(height: 10),

            // Email Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email:',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                SizedBox(
                  width: 220,
                  child: TextFormField(
                    controller: emailController,
                    //initialValue: userEmail,
                    decoration: InputDecoration(
                      hintText: 'Edit Email...',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              color: Colors.black38,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
