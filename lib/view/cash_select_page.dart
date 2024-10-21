import 'package:flutter/material.dart';

class CashSelectPage extends StatefulWidget {
  const CashSelectPage({super.key});

  @override
  State<CashSelectPage> createState() => _CashSelectPageState();
}

class _CashSelectPageState extends State<CashSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "TEMP CASH SELECT PAGE"
        ),
      ),
      body: Center(
        child: Text(
          "Cash Select Page",
        ),
      ),
    );
  }
}
