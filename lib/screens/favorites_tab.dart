import 'package:flutter/material.dart';

import '../models/product.dart';

/// Tab 2: the products the user has saved with the heart button.
class FavoritesTab extends StatelessWidget {
  const FavoritesTab({
    super.key,
    required this.favorites,
    required this.onToggleFavorite,
  });

  final List<Product> favorites;
  final ValueChanged<Product> onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favorites.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  'No saved items yet.\nTap the heart on a product in the Feed.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: favorites.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final product = favorites[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product.imagePath,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(product.title),
                  subtitle: Text(
                    '${product.category} · ${product.formattedPrice}',
                  ),
                  trailing: IconButton(
                    tooltip: 'Remove from favorites',
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () => onToggleFavorite(product),
                  ),
                );
              },
            ),
    );
  }
}
