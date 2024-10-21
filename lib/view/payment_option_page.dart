import 'package:flutter/material.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/view/card_selection_screen.dart';
import 'package:food_order_system/view/receipt.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/util/payment_option_util/payment_option_list.dart';

// Card, Cash, and G-cash Page
import 'package:food_order_system/view/cash_select_page.dart';
import 'package:food_order_system/view/gcash_select_page.dart';

class PaymentOptionPage extends StatefulWidget {

  
  const PaymentOptionPage({super.key});



  @override
  State<PaymentOptionPage> createState() => _PaymentOptionPageState();
}

class _PaymentOptionPageState extends State<PaymentOptionPage> {
  // Initialize select 1 index: Cash Button
  int? selectedButtonIndex = 1;

  List<int> indexButton = [
    1, // Cash Button Index
    2, // Card Button Index
    3, // G-cash Button Index
  ];



  void _onButtonSelected(int index) {
    setState(() {
      selectedButtonIndex = index; // Update the selected button index
    });
  }

  void _navigatePaymentSelect() {

    print(selectedButtonIndex);
    if (selectedButtonIndex == 1){
      currentTransaction.paymentOption = "Cash";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Receipt())
      );
    }
    else if (selectedButtonIndex == 2){
      currentTransaction.paymentOption = "Card";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CardSelectionScreen())
      );
    }
    else if (selectedButtonIndex == 3){
      currentTransaction.paymentOption = "Gcash";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Receipt())
      );
    }

    
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackArrowIcon(
          backgroundColor: Color.fromARGB(255, 5, 59, 80),
          iconColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Payment Method",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),

      // List of Payment Method
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 30.0),
                // Cash Button
                PaymentOptionList(
                  text: "Cash",
                  imagePath: "lib/images/cash.png",
                  isSelected: selectedButtonIndex == indexButton[0],
                  onPressed: () => _onButtonSelected(indexButton[0]),
                ),
                SizedBox(height: 30.0),

                // Card Button
                PaymentOptionList(
                  text: "Card",
                  imagePath: "lib/images/credit_card.png",
                  isSelected: selectedButtonIndex == indexButton[1],
                  onPressed: () => _onButtonSelected(indexButton[1]),
                ),
                SizedBox(height: 30.0),

                // G-Cash Button
                PaymentOptionList(
                  text: "G-Cash",
                  imagePath: "lib/images/gcash.png",
                  isSelected: selectedButtonIndex == indexButton[2],
                  onPressed: () => _onButtonSelected(indexButton[2]),
                ),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),

      // Next Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Color.fromARGB(255, 5, 59, 80),
          ),
          onPressed: _navigatePaymentSelect,
          child: Text(
            "Next",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
