class Product {
  final String id;
  final String name;
  final String imageAsset;
  final double oldPrice;
  final double price;
  final String description;
  final List<String> highlights;
  final double rating;
  final List<String> reviews;

  Product({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.oldPrice,
    required this.price,
    required this.description,
    required this.highlights,
    required this.rating,
    required this.reviews,
  });
}
