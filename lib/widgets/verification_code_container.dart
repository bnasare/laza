import 'package:flutter/material.dart';

class CodeContainer extends StatelessWidget {
  const CodeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.12,
      // width: MediaQuery.of(context).size.width * 0.2,
      width: 77,
      height: 98,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
                width: 1, color: Color.fromRGBO(143, 149, 158, 1))),
        // color: Colors.green
      ),
      // child: const Text("7"),
      child: const Center(
        child: TextField(
          style: TextStyle(
            color: Color(0xFF1D1E20),
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
