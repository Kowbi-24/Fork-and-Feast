import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/view/home_page.dart';
import 'package:intl/intl.dart';

import 'package:food_order_system/model/boxes.dart';


class Receipt extends StatelessWidget {


  Receipt({
    super.key,
  });

  void onPressed(context) async {
    // Add the current transaction to the transactionBox
    currentTransaction.userId = currentUser.id;
    await transactionBox.put('key_${currentTransaction.id}', currentTransaction.copy(currentTransaction));

    print(transactionBox.getAt(0).listFood);


    // Clear the current transaction in HomePage
    currentTransaction.listFood.clear();
    currentTransaction.totalPrice = 0;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM yyyy h:mm a').format(DateTime.now());
    double totalPrice = currentTransaction.getTotalPrice();

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Receipt',
            style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Spacer(),

            const Text(
              "------------------------------------",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),

            const Text(
              "Payment Successful",
              style: TextStyle(fontSize: 20),
            ),

            Text(
              "₱ ${totalPrice.toStringAsFixed(2)}",   // default yung asa huli kung null
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            Text(
              "Paid via ${currentTransaction.paymentOption}\n",  // default yung asa huli kung null
              style: TextStyle(fontSize: 15),
            ),

            Text(
              formattedDate,
              style: TextStyle(fontSize: 12),
            ),

            Text(
              "Reference no. ${Random().nextInt(4000)+1000 ?? 'N/A'}",    // default yung asa huli kung null
              style: TextStyle(fontSize: 12),
            ),

            Text(
              "------------------------------------",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),

            Text(
              "Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text(
              "Amount paid: ₱${totalPrice.toStringAsFixed(2)}",   // default yung asa huli kung null
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "Account Number: ${currentUser.id ?? 'N/A'}",    // default yung asa huli kung null
              style: TextStyle(fontSize: 12),
            ),
            FutureBuilder<int>(
              future: currentTransaction.generateId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading...", style: TextStyle(fontSize: 12));
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}",
                      style: TextStyle(fontSize: 12));
                } else {
                  return Text(
                    snapshot.hasData ? "Transaction Number: ${snapshot.data}" : "N/A",
                    style: TextStyle(fontSize: 12),
                  );
                }
              },
            ),

            Text(
              "Payment Method: ${currentTransaction.paymentOption}",    // default yung asa huli kung null
              style: TextStyle(fontSize: 12),
            ),

            Text(
              "------------------------------------",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),

            Spacer(),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 550,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                     onPressed(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 5, 59, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
