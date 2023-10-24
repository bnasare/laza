import 'package:flutter/material.dart';

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: MediaQuery.of(context).size.height * 0.09,
      color: const Color(0xFF9775FA),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFEFEFE),
            fontSize: 17,
            fontWeight: FontWeight.w500,
            height: 0.06,
          ),
        ),
      ),
    );
  }
}
