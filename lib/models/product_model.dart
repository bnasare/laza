class Product {
  final String imagePath;
  final String productName;
  final String? categoryName;
  final int price;
  final String description;
  final String gender;

  const Product({
    required this.imagePath,
    required this.productName,
    this.categoryName,
    required this.price,
    required this.description,
    required this.gender,
  });

  Product copy({
    String? imagePath,
    String? productName,
    String? categoryName,
    int? price,
    String? description,
    String? gender,
  }) =>
      Product(
          imagePath: imagePath ?? this.imagePath,
          productName: productName ?? this.productName,
          categoryName: categoryName ?? this.categoryName,
          price: price ?? this.price,
          description: description ?? this.description,
          gender: gender ?? this.gender);

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'productName': productName,
        'categoryName': categoryName,
        'price': price,
        'description': description,
        'gender': gender,
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
        imagePath: json['imagePath'],
        productName: json['productName'],
        categoryName: json['categoryName'],
        price: json['price'],
        description: json['description'],
        gender: json['gender'],
      );
}
