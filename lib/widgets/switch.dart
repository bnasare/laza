import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool initialState;

  const CustomSwitch({Key? key, required this.initialState}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState(initialState);
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool state;

  _CustomSwitchState(this.state);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: state,
      activeColor: Theme.of(context).colorScheme.onSecondary,
      onChanged: (bool value) {
        setState(() {
          state = value;
        });
      },
    );
  }
}
