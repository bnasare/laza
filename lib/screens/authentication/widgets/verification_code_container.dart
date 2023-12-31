import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the services library

class CodeContainer extends StatelessWidget {
  const CodeContainer({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77,
      height: 98,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
      child: Center(
        child: TextField(
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          controller: controller,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(1)
          ],
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          decoration:
              const InputDecoration(border: InputBorder.none, hintText: "0"),
        ),
      ),
    );
  }
}
