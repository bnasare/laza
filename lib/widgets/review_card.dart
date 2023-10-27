import 'package:flutter/material.dart';
import 'package:laza/consts/sizing_config.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.assetName, required this.name});

  final String assetName;
  final String name;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: ClipOval(
            child: Image.asset(
              'assets/images/$assetName.jpg',
              width: horizontalConverter(context, 40),
              height: verticalConverter(context, 40),
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: color.secondary,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.timer_outlined,
                size: 15,
                color: color.tertiary,
              ),
              Text(
                '  13 Sep, 2020',
                style: TextStyle(
                  color: color.tertiary,
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                ),
              )
            ],
          ),
          trailing: SizedBox(
            width: horizontalConverter(context, 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    softWrap: true,
                    text: TextSpan(children: [
                      TextSpan(
                        text: '4.8',
                        style: TextStyle(
                          color: color.secondary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' ratings',
                        style: TextStyle(
                          color: color.tertiary,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      )
                    ])),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 13,
                      color: color.onTertiary,
                    ),
                    Icon(
                      Icons.star,
                      size: 13,
                      color: color.onTertiary,
                    ),
                    Icon(
                      Icons.star,
                      size: 13,
                      color: color.onTertiary,
                    ),
                    Icon(
                      Icons.star,
                      size: 13,
                      color: color.onTertiary,
                    ),
                    const Icon(Icons.star_outline, size: 13),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalConverter(context, 20),
          ),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: color.tertiary,
            ),
          ),
        )
      ],
    );
  }
}
