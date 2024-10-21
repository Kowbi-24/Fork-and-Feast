import 'package:flutter/material.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/view/dining_location.dart';

class CartBottomNavBar extends StatelessWidget {

  CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: SizedBox(
          height: 100,
          child: BottomAppBar(
            color: Color(0xFF053B50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 15,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "₱ ${
                                currentTransaction.totalPrice
                                }",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      if (currentTransaction.listFood.isNotEmpty)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiningLocation(
                                    currentTransaction: currentTransaction,
                                  )),
                        );
                      }},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF3AA49C)),
                      shape:
                      WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Place Order",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

