import 'package:flutter/material.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';

class DataPolicyScreen extends StatelessWidget {
  const DataPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final policies = {
      'Privacy Policy': 'We respect your privacy and are committed to protecting your personal data. Information collected through the app will only be  used to improve your experience, process orders, and enhance app functionality. We wll not share your information with third parties unless required by law.',
      'Refund Policy': 'Since our app is ordering pick-up or dine-in meals, refunds are generally not provided once an order is confirmed. However, in the event of incorrect or unsatisfactory orders, please contact us through the app’s support feature for review.',
      'Order Policy': '• Orders can be placed for either pick-up or dine-in.\n'
          '• Please double-check all order details before confirmation, as modifications or cancellations are not allowed after submission.\n'
          '• Menu item availability may vary, and prices are subject to change without notice.',
      'Payment Policy': 'We accept the following payment methods:\n'
          '• Cash (upon pick-up or dine-in)\n '
          '• Credit/Debit Card\n '
          '• Gcash\n '
          'All transactions made through the app are secure and processed in compliance with industry standards.',
      'Data Security Policy': 'We take data security seriously and use encryption to protect your personal and payment information. However, by using the app, you acknowledge that no online platform can guarantee 100% security. ',
    };

    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: SliverAppBar(
                centerTitle: true,
                pinned: true, // This ensures the app bar remains pinned at the top
                backgroundColor: Color.fromARGB(255, 5, 59, 80),
                title: Text(
                  'Data Policy',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                leading: BackArrowIcon(
                  onPressed: () => Navigator.pop(context),
                ),
                // Remove elevation for a cleaner look (optional)
                elevation: 0.0,
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: policies.entries.map((entry) {
              return _buildLargeContainer(entry.key, entry.value);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildLargeContainer(String title, String content) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}