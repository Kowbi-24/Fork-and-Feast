import 'dart:math';

import 'package:food_order_system/model/user.dart';
import 'package:food_order_system/model/credit_card.dart';
import 'package:food_order_system/model/food.dart';
import 'package:food_order_system/model/transaction.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:food_order_system/model/boxes.dart';

class Controller{

  // To be used whenever app is ran for demonstration purposes
  void createDefaultUser() {
    if (userBox.isEmpty) {
      User defaultUser = User(001, "Djohn Paul Turla", "turlaBells@gmail.com",
          "12345", "09069472351", "profile_picture.jpg");
      userBox.put("key_${defaultUser.id}", defaultUser);
    }
  }


  // === USER METHODS ===========
  bool addUser(User user) {
    bool userAlreadyExists = false;
    for (User u in userBox.values){if (u.email == user.email) userAlreadyExists = true;};

    print(userBox.get(user.id));
    print("=== Already Exists: $userAlreadyExists =======");

    if (!userAlreadyExists){
      userBox.put("key_${user.id}", user);
      return true;
    }
    return false;
  }
  void deleteUser(User user) => userBox.delete("key_${user.id}");

  bool editUser(int id, User newUser, bool newEmail){

    bool userAlreadyExists = false;
    // If there is an email input, check if already taken
    if (newEmail)
    {
      for (User u in userBox.values) {
        if (u.email == newUser.email) userAlreadyExists = true;
      }
    }

    // If the email is not taken, edit user
    if (!userAlreadyExists){
      deleteUser(userBox.get("key_$id"));
      addUser(newUser);
      currentUser = newUser;
      return true;
    }
    return false;
  }



  int generateUserId(){
    int maxId = 0;
    for (User user in userBox.values) {
      maxId = max(maxId, user.id);
    }
    return maxId + 1;
  }


  // === TRANSACTION METHODS ========
  void addTransaction(Transaction transaction) => transactionBox.put("key_${transaction.id}", transaction);
  void deleteTransaction(Transaction transaction) => transactionBox.delete("key_${transaction.id}");
  
  List<Transaction> getAllTransaction(){
    List<Transaction> listTransaction = [];
    for (Transaction transaction in transactionBox.values){
      listTransaction.add(transaction);
    }
    return listTransaction;
  }


  // === CREDIT CARD METHODS ============
  void editCreditCard(CreditCard newCreditCard){
    newCreditCard.userId = currentUser.id;
    cardBox.delete("key_${newCreditCard.userId}");
    cardBox.put("key_${newCreditCard.userId}", newCreditCard);
    currentUserCreditCard = newCreditCard;
  }

  CreditCard getUserCreditCard(){
    return cardBox.containsKey("key_${currentUser.id}") ? cardBox.get("key_${currentUser.id}") : CreditCard("0000000000000000", "N.D.", "NO TYPE", "NO NAME");
  }

  // Used to group the numbers by 4 | EX: 0000 0000 0000 0000
  String formatCreditCardNumber(String number){
    String newNumber = "";

    for (int i=0; i<number.length; i++){
      if (i%4==0) newNumber += " ";
      newNumber += number[i];
    }

    return newNumber;
  }


  bool validateExpirationDate(String expirationDate){
    bool isValid = true;

    print(expirationDate.length);

    if (expirationDate.length != 8) {
      isValid = false;
    } else {
      for (int i=0; i<expirationDate.length; i++){
        // Check if the "/" is placed correctly
        if (((i==2) | (i==5)) & (expirationDate[i] != "/")){
          print("Should be /: ${expirationDate[i]}}");
          isValid = false;
        }else if (expirationDate[i] != "/"){
          // Check if the string is an integer
          try{
            int.parse(expirationDate[i]);
          }catch(e){
            isValid = false;
            print("Cannot Parse: ${expirationDate[i]}");
          }
        }
      }
    }

    return isValid;
  }

}