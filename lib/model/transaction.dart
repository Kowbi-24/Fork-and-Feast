
import 'package:food_order_system/model/food.dart';
import 'package:hive/hive.dart';
import 'boxes.dart';

import 'dart:math';


part 'transaction.g.dart';

@HiveType(typeId: 1)
class Transaction{

  @HiveField(0)
  late int id;

  @HiveField(1)
  late String paymentOption; // Card, Gcash, Cash | NOTE: Set when payment method selected
  
  @HiveField(2)
  late String diningLocation; // DineIn, PickUp

  @HiveField(3)
  Map<Food, int> listFood;

  @HiveField(4)
  double totalPrice = 0;

  @HiveField(5)
  late int? userId;

  Transaction(this.listFood);

  double getTotalPrice(){
    totalPrice = 0;
    listFood.forEach((k,v) => totalPrice += (k.price * v));
    return totalPrice;
  }

  // Used to assign the ID
  Future<int> generateId () async {
    List<int> listTransactionsId = [];

    // If the transaction box is not empty, get all values
    if (transactionBox.isNotEmpty) {
      for (Transaction transaction in transactionBox.values) {
        listTransactionsId.add(transaction.id);
      }
      
      id = listTransactionsId.reduce(max) + 1;
      
    }
    else{
      id = 0001;
    }

    return id;


  }

  Transaction copy(Transaction oldTransaction){
    Transaction newTransaction = Transaction(Map.from(oldTransaction.listFood));
    newTransaction.userId = oldTransaction.userId;
    newTransaction.id = oldTransaction.id;
    newTransaction.diningLocation = oldTransaction.diningLocation;
    newTransaction.paymentOption = oldTransaction.paymentOption;
    newTransaction.totalPrice = oldTransaction.totalPrice;

    return newTransaction;
  }

}