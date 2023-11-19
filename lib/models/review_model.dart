import 'package:flutter/material.dart';

class ReviewModel with ChangeNotifier {
  final String name;
  final DateTime time;
  final String review;
  final double rating;
  final int productId;

  ReviewModel({
    required this.name,
    required this.time,
    required this.review,
    required this.rating,
    required this.productId,
  });
}
