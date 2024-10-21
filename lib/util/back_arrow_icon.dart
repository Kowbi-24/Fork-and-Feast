import 'package:flutter/material.dart';

class BackArrowIcon extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  final void Function()? onPressed;

  const BackArrowIcon({
    Key? key,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.blue,
    this.size = 30.0,
    this.iconSize = 24.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: 45 * 3.1416 / 180,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: backgroundColor,
                  width: 2,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back,
              color: iconColor,
              size: iconSize,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}