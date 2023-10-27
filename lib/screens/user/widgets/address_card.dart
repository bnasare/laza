import 'package:flutter/material.dart';

class addressCard extends StatelessWidget {
  const addressCard({
    super.key,
    required this.assetName,
    this.firstLine,
    this.secondLine,
    this.heading,
  });

  final String assetName;
  final String? firstLine;
  final String? secondLine;
  final String? heading;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xffFEFEFE),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  heading!,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: color.secondary),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 13, color: color.secondary))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.asset(
                        'assets/images/$assetName.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            firstLine!,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: color.secondary),
                          ),
                        ),
                        Text(
                          secondLine!,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: color.secondary),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 105, 222, 109),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
