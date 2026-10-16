# Lab 7 — Multi-Screen App with Navigation & Tabs

Flutter (iOS) shop app with a `BottomNavigationBar` and a parameterized detail screen.

## Task
- **Root screen** (`RootScreen`) with a `BottomNavigationBar` and three tabs, kept in an `IndexedStack` so each tab keeps its state
  - **Feed**: 4 products with an image, title, category and price
  - **Favorites**: items saved with the heart button
  - **Profile**: avatar, name and simple settings
- **Detail screen** (`DetailScreen`): tapping a product calls `Navigator.push` and passes the complete `Product` object (title, description, image, price, category) through the constructor
- **Back navigation**: both the AppBar back icon and the in-body **Go Back** button call `Navigator.pop`. Only the detail screen is removed, so the tabs keep their state (favorites, scroll position, settings)

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailScreen(product: product)),
);
// ...and in DetailScreen:
Navigator.pop(context);
```

## Project structure
```
lib/
  main.dart                  # MaterialApp → RootScreen
  models/product.dart        # Product model + sample products
  screens/root_screen.dart   # BottomNavigationBar + favorites state
  screens/feed_tab.dart      # Tab 1, pushes DetailScreen
  screens/favorites_tab.dart # Tab 2
  screens/profile_tab.dart   # Tab 3
  screens/detail_screen.dart # Receives a Product, pops back
  widgets/product_card.dart  # Card used in the Feed
test/navigation_test.dart    # Tabs, push with arguments, pop, state kept
```

## Run
```bash
flutter pub get
flutter run        # pick an iOS simulator
flutter test       # widget tests
```

Product photos are from [Unsplash](https://unsplash.com).
