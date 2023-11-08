import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool initialState;


  const CustomSwitch({Key? key, required this.initialState}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool state;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    state = widget.initialState;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: rememberMe,
      activeColor: Theme.of(context).colorScheme.onSecondary,
      onChanged: (bool value) {
        setState(() {
         rememberMe= !rememberMe;
        });
      },
    );
  }
}
