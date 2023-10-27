import 'package:flutter/material.dart';

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return BottomAppBar(
<
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFEFEFE),
            fontSize: 17,
            fontWeight: FontWeight.w500,
            // height: 0.06,
          ),
        ),
      ),
    );
  }
}
