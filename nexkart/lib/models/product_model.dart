class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final String? oldPrice;
  final String? newPrice;
  final String? discount;
  final String? delivery;
  final String? brand;
  final String? title;
  final String? buttonText;
  final String? highlightImage;
  final String? highlightText;
  final String? description;
  final String? imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.oldPrice,
    this.newPrice,
    this.discount,
    this.delivery,
    this.brand,
    this.title,
    this.buttonText,
    this.highlightImage,
    this.highlightText,
    this.description,
    this.imageUrl,
  });
}
