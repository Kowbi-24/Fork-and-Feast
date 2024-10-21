import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget{

  Icon icon;
  String buttonName;
  bool isFocused;
  Function()? onPressed;

  CategoryButton({
      super.key,
      required this.icon,
      required this.buttonName,
      required this.isFocused,
      required this.onPressed
    });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(3),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: isFocused ? Color.fromARGB(255, 23, 107, 135) : Colors.white,
          foregroundColor: isFocused ? Colors.white : Colors.black,
        ),
        
        child: Row(
          children: [
            icon, 
            const SizedBox(width: 8,),
            Text(buttonName)],
        ),
        
      ),
    );
  }
}