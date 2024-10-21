import 'package:flutter/material.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/view/about_us_screen.dart';
import 'package:food_order_system/view/choose_login.dart';
import 'package:food_order_system/view/home_page.dart';
import 'package:food_order_system/view/loading_screen.dart';
import 'package:food_order_system/view/profile_page.dart';
import 'package:food_order_system/view/settings_page.dart';
import 'package:food_order_system/view/transactions.dart';
import 'package:food_order_system/util/profile_util/custom_circle_avatar.dart';

import 'package:food_order_system/model/boxes.dart';

class SideBar extends StatelessWidget{

  double accountBalance;

  SideBar({
    super.key,
    required this.accountBalance,
  });

  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Color.fromARGB(255, 5, 59, 80),
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 23, 107, 135),
              height: 200,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: CustomCircleAvatar(widthSize: 80, heightSize: 80, userProfilePicture: "profile_picture.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 30),
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${currentUser.name}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "${currentUser.email}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(
                Icons.history,
                color: Colors.white,
              ),
              title: const Text(
                "History",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {

                List<Transaction> listTransactions = [];

                for (Transaction transaction in transactionBox.values) {
                    if (currentUser.id == transaction.userId){
                      listTransactions.add(transaction);
                    }
                  }
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Transactions(transactions: listTransactions,))
                );
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),  
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.question_mark,
                color: Colors.white,
              ),
              title: const Text(
                "About us",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen())
                );
              },
            ),
            
            Spacer(),

            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              title: const Text(
                "Log out",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseLogin())
                );
              },
            ),
          ],
        ),
    );
  }
}