import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final String imagePath;
  final String name;
  final String category;
  final double price;
  final String description;
  final String gender;
  final List<String> productImages;

  ProductModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.gender,
    required this.productImages,
  });
}
