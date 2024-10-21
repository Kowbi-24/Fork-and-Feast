import 'package:flutter/material.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';
import 'package:food_order_system/util/settings_util/settings_body.dart';


class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context){
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
        centerTitle: true,
        title: const Text(
              "SETTINGS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
      ),
        body: settings_body(),
      ),
    );
  }
}



