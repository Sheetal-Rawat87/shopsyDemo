class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      rating: json['rating'] != null ? (json['rating']['rate'] as num).toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'price': price,
    'image': image,
    'rating': rating,
  };
} 