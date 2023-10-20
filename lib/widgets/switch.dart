import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  MySwitch({super.key, required this.state});
  bool state;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: state,
      activeColor: Colors.green,
      onChanged: (bool value) {
        state = value;
      },
    );
  }
}
