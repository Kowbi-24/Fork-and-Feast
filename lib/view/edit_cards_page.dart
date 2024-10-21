import 'package:flutter/material.dart';
import 'package:food_order_system/controller/controller.dart';
import 'package:food_order_system/model/credit_card.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';
import 'package:food_order_system/util/edit_cards_util/edit_card_details.dart';
import 'package:food_order_system/util/profile_util/save_dialog_box.dart';
import 'package:food_order_system/view/card_selection_screen.dart';

class EditCardsPage extends StatefulWidget {

  Function updateCardValues;

  EditCardsPage({
    super.key,
    required this.updateCardValues,
  });

  @override
  State<EditCardsPage> createState() => _EditCardsPageState();
}

class _EditCardsPageState extends State<EditCardsPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController cardTypeController = TextEditingController();

  // Code to save all the changes | Will return TRUE if successful, FALSE otherwise
  bool SaveChanges(context){
    CreditCard currentCreditCard = Controller().getUserCreditCard();
    String cardNum = cardNumberController.text.isNotEmpty ? cardNumberController.text : currentCreditCard.cardNum;
    String holderName = cardHolderNameController.text.isNotEmpty ? cardHolderNameController.text : currentCreditCard.holderName;
    String expiryDate = expirationDateController.text.isNotEmpty ? expirationDateController.text : currentCreditCard.expiryDate;
    String type = cardTypeController.text.isNotEmpty ? cardTypeController.text : currentCreditCard.type;

    bool validCardNumber = (cardNum.length == 16);
    bool validHolderName = true; // KOBE: Will be changed if needed
    bool validExpirationDate = (Controller().validateExpirationDate(expiryDate));
    bool validType = true; // KOBE: Will be changed if needed

    print("$cardNum | $holderName | $expiryDate | $type");
    print("Num: $validCardNumber | Date: $validExpirationDate");
    print(cardNumberController.text.length);

    List listInvalid = [];

    // Code that will run if everything is valid
    if (validCardNumber & validHolderName & validExpirationDate & validType){
      CreditCard newCard = CreditCard(cardNum, expiryDate, type, holderName);
      
      widget.updateCardValues(newCard);
      
      return true;
    }
    if(!validCardNumber) listInvalid.add("Card Number");
    if(!validHolderName) listInvalid.add("HolderName");
    if(!validExpirationDate) listInvalid.add("Expiration Date");
    if(!validType) listInvalid.add("Card Type");


    // Format Alert Dialog
    print(listInvalid);
    String alertDialogText = "INVALID INPUTS";
    for (String invalid in listInvalid) {
      alertDialogText += "\n - $invalid";
    }
    showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(alertDialogText),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowIcon(
          backgroundColor: Color.fromARGB(255, 5, 59, 80),
          iconColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
              "EDIT CARD",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
      ),
      body: EditCardDetails(cardHolderNameController: cardHolderNameController, cardNumberController: cardNumberController, expirationDateController: expirationDateController, cardTypeController: cardTypeController,),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Color.fromARGB(255, 5, 59, 80),
          ),
          child: Text(
            'Save Changes',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            if (SaveChanges(context)){
              Navigator.pop(context);
            }

          },
        ),
      ),
    );
  }
}



