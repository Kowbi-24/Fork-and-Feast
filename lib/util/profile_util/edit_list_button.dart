import 'package:flutter/material.dart';

class EditListButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const EditListButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        //width: 300,
        height: 50,
      
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            elevation: 5, // Shadow depth
            padding: EdgeInsets.zero,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black87,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}