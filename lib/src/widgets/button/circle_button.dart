import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Widget icon;
  final double iconSize;
  final Function() onPressed;
  final Color? color;

  const CircleButton({
    Key? key,
    required this.icon,
    this.color,
    required this.iconSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color:color ?? Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: icon,
        iconSize: iconSize,
        color:Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}
