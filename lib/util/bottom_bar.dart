import 'package:flutter/material.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/view/dining_location.dart';
import 'package:food_order_system/view/home_page.dart';
import 'package:food_order_system/view/profile_page.dart';
import 'package:food_order_system/view/settings_page.dart';
import 'package:food_order_system/view/transactions.dart';

import 'package:food_order_system/model/boxes.dart';

class BottomBar extends StatelessWidget{
  BottomBar({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        child: BottomAppBar(
          color: Color.fromARGB(255, 5, 59, 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage())
                      );
                    },
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                ),
                IconButton(
                  onPressed: () {

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
                  icon: Icon(Icons.history_rounded),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                  },
                  icon: Icon(Icons.person),
                  color: Colors.white,
                ),
              ],
            ),
        ),
      ),
    );
  }
}