import 'package:flutter/material.dart';
import 'package:food_order_system/model/food.dart';
import 'package:food_order_system/model/boxes.dart';

import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/util/cart_util/cart_Item.dart';
import 'package:food_order_system/util/cart_util/cart_botNavBar.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';

class Cart extends StatefulWidget {

  Cart({super.key});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  void removeFood(int index) {
    setState(() {
      var removedKey = currentTransaction.listFood.keys.elementAt(index);
      currentTransaction.listFood.remove(removedKey);
    });
  }

  void newTotalPrice(double newTotalPrice){
    setState(() {
      currentTransaction.totalPrice = newTotalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackArrowIcon(
            backgroundColor: Color.fromARGB(255, 5, 59, 80),
            iconColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Cart",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: currentTransaction.listFood.isNotEmpty
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentTransaction.listFood.keys.length,
                      itemBuilder: (context, index) {
                        // Ensure you get the current food and quantity each time
                        var food = currentTransaction.listFood.keys.elementAt(index);
                        var quantity = currentTransaction.listFood[food];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: CartItem(
                            food: food,
                            quantity: quantity!,
                            currentTransaction: currentTransaction,
                            index: index,
                            removeItem: removeFood,
                            newTotalPrice: newTotalPrice,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
        bottomNavigationBar: CartBottomNavBar(),
      ),
    );
  }
}
