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

## Photo credits
Product photos from Wikimedia Commons, resized for the app:

| Product | Photo | Author | License |
|---|---|---|---|
| iPhone 14 Pro | [iPhone 14 Pro Deep Purple](https://commons.wikimedia.org/wiki/File:IPhone_14_Pro_Deep_Purple.jpg) | iGeeksBlog | CC BY-SA 4.0 |
| MacBook Pro 13" M1 | [MacBook Pro 13" M1 2020](https://commons.wikimedia.org/wiki/File:Macbook_Pro_13%22_M1_2020.jpg) | DYVER | CC BY-SA 4.0 |
| JBL Wireless Earbuds | [JBL earbuds](https://commons.wikimedia.org/wiki/File:2023_S%C5%82uchawki_JBL_TL0846_(2).jpg) | Jacek Halicki | CC BY-SA 4.0 |
| Wireless Controller | [Xbox controller](https://commons.wikimedia.org/wiki/File:Xbox-360-Controller-Black.jpg) | Evan-Amos | Public domain |
