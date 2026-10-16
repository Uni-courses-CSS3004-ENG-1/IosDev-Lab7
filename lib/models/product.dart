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
    id: 'iphone',
    title: 'iPhone 14 Pro',
    description:
        '6.1-inch Super Retina XDR display with ProMotion and Dynamic '
        'Island, A16 Bionic chip and a 48 MP main camera. Deep Purple.',
    imagePath: 'assets/images/iphone.jpg',
    price: 899.00,
    category: 'Phones',
  ),
  Product(
    id: 'macbook',
    title: 'MacBook Pro 13" M1',
    description:
        'Apple M1 chip, 8 GB of unified memory and a 256 GB SSD. '
        'Retina display and up to 20 hours of battery life. Space Gray.',
    imagePath: 'assets/images/macbook.jpg',
    price: 999.00,
    category: 'Laptops',
  ),
  Product(
    id: 'earbuds',
    title: 'JBL Wireless Earbuds',
    description:
        'Sweat-proof true wireless earbuds with touch controls and a '
        'pocket-size charging case for up to 30 hours of music.',
    imagePath: 'assets/images/earbuds.jpg',
    price: 99.00,
    category: 'Audio',
  ),
  Product(
    id: 'controller',
    title: 'Wireless Controller',
    description:
        'Comfortable wireless gamepad with two analog sticks, rumble '
        'feedback and responsive triggers. Works with PC and Xbox.',
    imagePath: 'assets/images/controller.jpg',
    price: 49.99,
    category: 'Gaming',
  ),
];
