import 'package:flutter/material.dart';

class ButtonMoveScreen extends StatelessWidget {
  const ButtonMoveScreen({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: Colors.white),
      // child: const Icon(Icons.arrow_back_ios, color: Colors.white),
    );
  }
}
