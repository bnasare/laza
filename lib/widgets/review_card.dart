import 'package:flutter/material.dart';
import 'package:laza/consts/sizing_config.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.assetName, required this.name});

  final String assetName;
  final String name;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      height: verticalConverter(context, 113),
      width: horizontalConverter(context, 335),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset('assets/images/$assetName.jpg'),
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
              width: horizontalConverter(context, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        '4.8',
                        style: TextStyle(
                          color: color.secondary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' rating',
                        style: TextStyle(
                          color: color.tertiary,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, size: 13, color: color.onTertiary,),
                      Icon(Icons.star, size: 13, color: color.onTertiary,),
                      Icon(Icons.star, size: 13, color: color.onTertiary,),
                      Icon(Icons.star, size: 13, color: color.onTertiary,),
                      const Icon(Icons.star_outline, size: 13),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalConverter(context, 20)),
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
      ),
    );
  }
}
