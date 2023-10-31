class Product {
  final String imagePath;
  final String productName;
  final String brandName;
  final int price;
  final String description;

  const Product({
    required this.imagePath,
    required this.productName,
    required this.brandName,
    required this.price,
    required this.description,
  });

  Product copy({
    String? imagePath,
    String? productName,
    String? brandName,
    int? price,
    String? description,
  }) =>
      Product(
        imagePath: imagePath ?? this.imagePath,
        productName: productName ?? this.productName,
        brandName: brandName ?? this.brandName,
        price: price ?? this.price,
        description: description ?? this.description,
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'productName': productName,
        'brandName': brandName,
        'price': price,
        'description': description,
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
        imagePath: json['imagePath'],
        productName: json['productName'],
        brandName: json['brandName'],
        price: json['price'],
        description: json['description'],
      );
}
