import 'package:flutter/material.dart';

class BottomAuthButton extends StatelessWidget {
  const BottomAuthButton({super.key, required this.text, this.onTap});

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color.fromRGBO(151, 117, 250, 1),
        height: 75,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
