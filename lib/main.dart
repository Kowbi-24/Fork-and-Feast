/* 
  Food Img size requirements: 1011px x 950px


  Colors:
  - Color.fromARGB(255, 5, 59, 80)  || This is the darker shade of blue
  - Color.fromARGB(255, 23, 107, 135)   || The lighter shade of blue
*/


/* 
  TODO: Edit card functionality
*/


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_order_system/controller/controller.dart';
import 'package:food_order_system/model/credit_card.dart';
import 'package:food_order_system/model/food.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/model/user.dart';
import 'package:food_order_system/view/food_detail_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:food_order_system/view/home_page.dart';
import 'package:food_order_system/view/loading_screen.dart';
import 'package:food_order_system/view/login_screen.dart';
import 'package:food_order_system/view/login_screen.dart';
import 'package:food_order_system/view/choose_login.dart';
import 'package:food_order_system/view/signup_screen.dart';

import 'package:food_order_system/model/boxes.dart';


void main() async {

  // Initialize HIVE
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(FoodAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CreditCardAdapter());


  // Create the box
  transactionBox = await Hive.openBox<Transaction>('transactionBox');
  foodBox = await Hive.openBox<Food>('foodBox');
  userBox = await Hive.openBox<User>('userBox');
  cardBox = await Hive.openBox<CreditCard>('creditCardBox');

  // Create default user
  Controller().createDefaultUser();


  // Run app
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){

    // Ensure the applicatin does not change orientation when device is rotated
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChooseLogin(), // To remove loading screen, change to "HomePage()"
    );
  }
}


void initializeFoodData(){

  List<Food> initalizedFood = [];
  final _db = Hive.box('db');

  _db.put(1,"Food one");
}