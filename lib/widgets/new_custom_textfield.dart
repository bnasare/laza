import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.verticalLength,
    required this.horizontalLength,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final double verticalLength; // Change the type to double for height
  final double horizontalLength; // Change the type to double for width

  @override
  Widget build(BuildContext context) {
    return Container(
      width: horizontalLength, // Use horizontalLength for width
      height: verticalLength, // Use verticalLength for height
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
       color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextField(
        
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color.fromRGBO(143, 149, 158, 1),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
