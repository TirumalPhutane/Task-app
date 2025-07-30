class Product {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as int,
    title: json['title'] as String,
    price: (json['price'] as num).toDouble(),
    description: json['description'] as String,
    category: json['category'] as String,
    image: json['image'] as String,
  );

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
  };

  Product copy(Map<String, dynamic> updateFields) {
    return Product(
      id: updateFields['id'] ?? id,
      title: updateFields['title'] ?? title,
      price: updateFields['price'] ?? price,
      description: updateFields['description'] ?? description,
      category: updateFields['category'] ?? category,
      image: image,
    );
  }
}
