/// A single item shown in the Feed and passed whole to the DetailScreen.
class Product {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
  });

  final String id;
  final String title;
  final String description;
  final String imagePath;
  final double price;
  final String category;

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}

const sampleProducts = [
  Product(
    id: 'headphones',
    title: 'Wireless Headphones',
    description:
        'Over-ear Bluetooth headphones with active noise cancelling, '
        'soft memory-foam cushions and up to 30 hours of battery life.',
    imagePath: 'assets/images/headphones.jpg',
    price: 129.99,
    category: 'Audio',
  ),
  Product(
    id: 'watch',
    title: 'Smart Watch',
    description:
        'Minimal round smart watch that tracks steps, heart rate and sleep. '
        'Water resistant, with a comfortable silicone strap.',
    imagePath: 'assets/images/watch.jpg',
    price: 199.00,
    category: 'Wearables',
  ),
  Product(
    id: 'sneakers',
    title: 'Running Sneakers',
    description:
        'Lightweight knit running shoes with a cushioned sole for '
        'everyday training and long-distance runs.',
    imagePath: 'assets/images/sneakers.jpg',
    price: 89.50,
    category: 'Shoes',
  ),
  Product(
    id: 'camera',
    title: 'Instant Camera',
    description:
        'Retro instant camera that prints photos in seconds. '
        'Built-in flash and a selfie mirror for perfect shots.',
    imagePath: 'assets/images/camera.jpg',
    price: 74.99,
    category: 'Photo',
  ),
];
