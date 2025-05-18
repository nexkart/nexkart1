import 'package:nexkart2/models/product_model.dart';

final List<Product> sampleProducts = [
  Product(
    id: '1',
    name: 'Red T-Shirt',
    imageAsset: 'assets/images/tshirt_yellow_collar.png',
    oldPrice: 699.0,
    price: 499.0,
    description:
        'A bright red t-shirt made of 100% cotton. Great for casual wear.',
    highlights: ['100% Cotton', 'Slim Fit', 'Machine Washable'],
    rating: 4.5,
    reviews: [
      'Great fabric and quality!',
      'Color is vibrant and fits perfectly.',
    ],
  ),
  Product(
    id: '2',
    name: 'Blue Jeans',
    imageAsset: 'assets/images/tshirt_red_collar.png',
    oldPrice: 1299.0,
    price: 999.0,
    description: 'Comfortable blue jeans with a modern fit for everyday wear.',
    highlights: ['Stretchable Denim', 'Skinny Fit', 'Zipper Closure'],
    rating: 4.2,
    reviews: ['Fits well and looks great!', 'Good quality at this price.'],
  ),
  Product(
    id: '3',
    name: 'White Sneakers',
    imageAsset: 'assets/images/tshirt_yellow_collar.png',
    oldPrice: 1799.0,
    price: 1499.0,
    description:
        'Stylish and durable white sneakers perfect for all-day comfort.',
    highlights: ['Rubber Sole', 'Breathable Material', 'Lightweight Design'],
    rating: 4.6,
    reviews: [
      'Very comfortable and stylish!',
      'Love the clean look of these sneakers.',
    ],
  ),
  Product(
    id: '4',
    name: 'White Sneakers',
    imageAsset: 'assets/images/tshirt_yellow_collar.png',
    oldPrice: 1799.0,
    price: 1499.0,
    description:
        'Stylish and durable white sneakers perfect for all-day comfort.',
    highlights: ['Rubber Sole', 'Breathable Material', 'Lightweight Design'],
    rating: 4.6,
    reviews: [
      'Very comfortable and stylish!',
      'Love the clean look of these sneakers.',
    ],
  ),
];
