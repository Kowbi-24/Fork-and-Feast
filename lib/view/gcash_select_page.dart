import 'package:flutter/material.dart';

class GcashSelectPage extends StatefulWidget {
  const GcashSelectPage({super.key});

  @override
  State<GcashSelectPage> createState() => _GcashSelectPageState();
}

class _GcashSelectPageState extends State<GcashSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "TEMP GCASH SELECT PAGE"
        ),
      ),
      body: Center(
        child: Text(
          "G-cash Select Page",
        ),
      ),
    );
  }
}
