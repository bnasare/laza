import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  MySwitch({super.key, required this.state});
  late bool state;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: state,
      activeColor: Colors.green,
      onChanged: (bool value) {
        // setState((){});
        state = value;
      },
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool state = true;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: state,
      activeColor: Colors.green,
      onChanged: (bool value) {
        setState(() {
          state = value;
        });
      },
    );
  }
}
