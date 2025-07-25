class Product {
  final String name;
  final String desc;
  final String image;
  final String price;
  bool isFavorite;

  Product({
    required this.name,
    required this.desc,
    required this.image,
    required this.price,
    this.isFavorite = false,
  });

  factory Product.fromMap(Map<String, String> map) {
    return Product(
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      isFavorite: map['isFavorite'] == 'true',
    );
  }
}
