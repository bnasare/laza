import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDisplay extends StatelessWidget {
  const RatingDisplay({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Expanded(
      child: RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 13,
        itemPadding: EdgeInsets.zero,
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: color.onTertiary,
        ),
        onRatingUpdate: (rating) {},
      ),
    );
  }
}