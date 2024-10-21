import 'package:flutter/material.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';

void main() => runApp(MaterialApp(
  home: Terms(),
  debugShowCheckedModeBanner: false,
));

class Terms extends StatelessWidget {
  @override
  Widget _header(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _bulletText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• ', style: TextStyle(fontSize: 18)),
        Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,      //alisin if hindi match sa bg ng iba
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
              "TERMS & CONDITIONS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                
                SizedBox(height: 20),
                Text('Welcome to Fork & Feast! Please read these Terms and Conditions carefully before using our mobile application operated by [group name/us].',
                style: TextStyle(fontSize: 18),),
                SizedBox(height: 20),
                Divider(thickness: 1),
                _header('1. Acceptance of Terms'),
                _bulletText('By using the app, you agree to these Terms. If you disagree with any part of the Terms, you may not use the app.'),
                SizedBox(height: 20),
                Divider(thickness: 1),
                _header('2. Use of the App'),
                _bulletText('This app is designed to allow users to order meals for pick-up or dine-in at our partnered restaurant.'),
                _bulletText('You may use the app only for lawful purposes. Any misuse of the app, including fraudulent activity or interference with the app’s performance, is prohibited.'),
                SizedBox(height: 20),
                Divider(thickness: 1),
                _header('3. User Accounts'),
                _bulletText('Users are required to create an account to access app features such as ordering meals, viewing past transactions, and saving favorite items.'),
                _bulletText('Users must ensure the confidentiality of their account information. If you believe your account has been compromised, contact us immediately.'),
                SizedBox(height: 20),
                Divider(thickness: 1),
                _header('4. Orders and Payment'),
                _bulletText('Orders can be placed for pick-up or dine-in only at our designated restaurant.'),
                _bulletText('Payments can be made via cash, credit/debit card, or GCash.'),
                _bulletText('All orders are subject to availability, and prices are subject to change.'),
                SizedBox(height: 20),
                Divider(thickness: 1),
                _header('5. Order Cancellation and Charges'),
                _bulletText('Once an order is confirmed, it cannot be canceled or modified unless otherwise stated in special circumstances.'),
                _bulletText('If you encounter any issues with your order, please contact us through the app’s support feature immediately.'),
                SizedBox(height: 20),
                Divider(thickness: 1),
                _header('6. Limitation of Liability'),
                _bulletText('We are not responsible for any loss or damages that may occur due to technical issues, incorrect orders, or unavailability of certain menu items.'),
                SizedBox(height: 20),
                Divider(thickness: 1),
                _header('7. Changes to Terms'),
                _bulletText('We reserve the right to update or change these Terms at any time. Continued use of the app following changes signifies acceptance of the updated Terms.'),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}