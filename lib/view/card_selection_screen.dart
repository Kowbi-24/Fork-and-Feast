import 'package:flutter/material.dart';
import 'package:food_order_system/controller/controller.dart';
import 'package:food_order_system/model/credit_card.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/view/edit_cards_page.dart';
import 'package:food_order_system/view/home_page.dart';
import 'package:food_order_system/view/receipt.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';
//import 'placeholder.dart';

class CardSelectionScreen extends StatefulWidget {
  
  CardSelectionScreen({super.key});

  @override
  _CardSelectionScreenState createState() => _CardSelectionScreenState();
}

class _CardSelectionScreenState extends State<CardSelectionScreen> {

  void updateCardValues(CreditCard newCard){
    setState(() {
      Controller().editCreditCard(newCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackArrowIcon(
          backgroundColor: Colors.white,
          iconColor: Color.fromARGB(255, 5, 59, 80),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Confirm Card",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: _buildCardOption(currentUserCreditCard.type, currentUserCreditCard.holderName, Controller().formatCreditCardNumber(currentUserCreditCard.cardNum)),
          ),
          Spacer(),
          Center(
            child: _buildCardOption(currentUserCreditCard.type, currentUserCreditCard.expiryDate, '=====================')
          ),

          Spacer(),
          
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditCardsPage(updateCardValues: updateCardValues,)),
              );
            },
            child: Container(
              //margin: const EdgeInsets.symmetric(horizontal: 40),
              width: 250,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color.fromRGBO(100, 204, 197, 1), width: 1),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings, color: Color.fromRGBO(100, 204, 197, 1)),
                  SizedBox(width: 10),
                  Text(
                    'Edit Card',
                    style: TextStyle(color: Color.fromRGBO(100, 204, 197, 1)),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Receipt()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(23, 107, 135, 1),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardOption(String cardType, String cardholderName, String cardNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 340,
        height: 200,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(5, 59, 80, 1),
              Color.fromRGBO(25, 101, 135, 0.7),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HAU BANK',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              cardNumber,
              style: TextStyle(fontSize: 18, letterSpacing: 2.0, color: Colors.white),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardholderName,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  cardType,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Card'),
      ),
      body: Center(
        child: Text('Add Card Form Goes Here'),
      ),
    );
  }
}
