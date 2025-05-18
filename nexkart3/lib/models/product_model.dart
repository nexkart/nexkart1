class ProductModel {
  final String image;
  final String name;
  final String oldPrice;
  final String newPrice;
  final String highlightImage;
  final String highlightText;
  final String discount;
  final String delivery;
  final String? brand;
  final String? title;
  final String? buttonText;

  ProductModel({
    required this.image,
    required this.name,
    required this.oldPrice,
    required this.newPrice,
    required this.highlightImage,
    required this.highlightText,
    required this.discount,
    required this.delivery,
    required this.brand,
    required this.title,
    required this.buttonText,
  });
}
