import 'package:flutter/material.dart';

import '../models/product.dart';
import 'favorites_tab.dart';
import 'feed_tab.dart';
import 'profile_tab.dart';

/// Root screen: holds the BottomNavigationBar and switches between tabs.
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  // Favorites live here so both the Feed and Favorites tabs see the same data.
  final Set<String> _favoriteIds = {};

  void _toggleFavorite(Product product) {
    setState(() {
      if (!_favoriteIds.remove(product.id)) {
        _favoriteIds.add(product.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final favorites = sampleProducts
        .where((product) => _favoriteIds.contains(product.id))
        .toList();

    final tabs = [
      FeedTab(
        products: sampleProducts,
        favoriteIds: _favoriteIds,
        onToggleFavorite: _toggleFavorite,
      ),
      FavoritesTab(favorites: favorites, onToggleFavorite: _toggleFavorite),
      const ProfileTab(),
    ];

    return Scaffold(
      // IndexedStack keeps every tab alive, so switching tabs keeps their state.
      body: IndexedStack(index: _currentIndex, children: tabs),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            activeIcon: Icon(Icons.storefront),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
