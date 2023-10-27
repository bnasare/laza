import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShirtCard extends StatelessWidget {
  const ShirtCard({
    super.key,
    required this.assetName,
    this.firstLine,
    this.price,
    this.secondLine,
    this.numItems,
    this.cardColor,
  });

  final String assetName;
  final String? firstLine;
  final String? secondLine;
  final String? price;
  final int? numItems;
  final int? cardColor;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Color(cardColor!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                    child: Image.asset(
                  'assets/images/$assetName.png',
                ))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstLine!,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: color.secondary),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  secondLine!,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: color.secondary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 12),
                child: Text(
                  price!,
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8F959E)),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1.0, color: const Color(0xff8F959E))),
                    child: const Center(
                      child: Icon(
                        Icons.expand_more,
                        size: 15,
                        color: Color(0xff8F959E),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Text(
                      ' ${numItems!}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1.0, color: const Color(0xff8F959E))),
                    child: const Center(
                      child: Icon(
                        Icons.expand_less,
                        size: 15,
                        color: Color(0xff8F959E),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 115),
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1.0, color: const Color(0xff8F959E))),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.trash,
                        size: 15,
                        color: Color(0xff8F959E),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
