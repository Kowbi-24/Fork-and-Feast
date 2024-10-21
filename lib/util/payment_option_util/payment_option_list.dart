import 'package:flutter/material.dart';

class PaymentOptionList extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onPressed;

  const PaymentOptionList({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 5, // Shadow depth
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
              ),
              SizedBox(width: 20),
              Text(
                  text,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 12,
                backgroundColor: isSelected ? Color.fromARGB(255, 5, 59, 80) : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
