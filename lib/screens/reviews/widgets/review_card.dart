import 'package:flutter/material.dart';
import 'package:laza/consts/sizing_config.dart';
import 'package:intl/intl.dart';
import 'package:laza/screens/reviews/widgets/rating_widget.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.name,
    required this.time,
    required this.review,
    required this.rating,
  });

  final String name;
  final DateTime time;
  final String review;
  final double rating;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    String formattedDate = DateFormat('dd MMM, yyyy').format(time);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: ClipOval(
            child: Image.asset(
              'assets/images/user.jpg',
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
                '  $formattedDate',
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
                        text: '$rating',
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
                    RatingDisplay(rating: rating),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalConverter(context, 20),
          ),
          child: Text(
            review,
            style: TextStyle(
              height: 1.4,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: color.tertiary,
            ),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}