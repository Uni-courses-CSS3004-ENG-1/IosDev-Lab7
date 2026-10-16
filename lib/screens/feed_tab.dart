import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';
import 'detail_screen.dart';

/// Tab 1: the list of products.
class FeedTab extends StatelessWidget {
  const FeedTab({
    super.key,
    required this.products,
    required this.favoriteIds,
    required this.onToggleFavorite,
  });

  final List<Product> products;
  final Set<String> favoriteIds;
  final ValueChanged<Product> onToggleFavorite;

  /// Pushes the DetailScreen and passes it the whole Product object.
  void _openDetail(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(product: product)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feed')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            isFavorite: favoriteIds.contains(product.id),
            onFavoriteToggle: () => onToggleFavorite(product),
            onTap: () => _openDetail(context, product),
          );
        },
      ),
    );
  }
}
