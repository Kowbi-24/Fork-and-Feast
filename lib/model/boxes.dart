import 'package:food_order_system/controller/controller.dart';
import 'package:food_order_system/model/credit_card.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box transactionBox;
late Box foodBox;
late Box userBox;
late Box cardBox;

// These are variables used globally around the program
late User currentUser;
CreditCard currentUserCreditCard = Controller().getUserCreditCard();
Transaction currentTransaction = Transaction({});