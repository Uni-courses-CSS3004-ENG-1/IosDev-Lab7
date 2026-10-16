import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_navigation/main.dart';
import 'package:shop_navigation/models/product.dart';
import 'package:shop_navigation/screens/detail_screen.dart';

void main() {
  final headphones = sampleProducts.first;

  // Use an iPhone-sized screen instead of the default 800x600 test window.
  Future<void> pumpApp(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const ShopApp());
  }

  Future<void> openHeadphones(WidgetTester tester) async {
    await tester.tap(find.text(headphones.title));
    await tester.pumpAndSettle();
  }

  testWidgets('BottomNavigationBar switches between the three tabs', (
    tester,
  ) async {
    await pumpApp(tester);
    expect(find.text(headphones.title), findsOneWidget);

    await tester.tap(find.text('Favorites').last);
    await tester.pump();
    expect(find.textContaining('No saved items'), findsOneWidget);

    await tester.tap(find.text('Profile').last);
    await tester.pump();
    expect(find.text('Notifications'), findsOneWidget);
  });

  testWidgets('tapping a Feed item pushes DetailScreen with the full Product', (
    tester,
  ) async {
    await pumpApp(tester);
    await openHeadphones(tester);

    final detail = tester.widget<DetailScreen>(find.byType(DetailScreen));
    expect(detail.product, same(headphones));

    expect(find.text(headphones.category), findsOneWidget);
    expect(find.text(headphones.formattedPrice), findsOneWidget);
    expect(find.text(headphones.description), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsNothing);
  });

  testWidgets('AppBar back icon pops back to the Feed', (tester) async {
    await pumpApp(tester);
    await openHeadphones(tester);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.byType(DetailScreen), findsNothing);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Go Back button pops and the tabs keep their state', (
    tester,
  ) async {
    await pumpApp(tester);

    // Save an item, then open and close its detail screen.
    await tester.tap(find.byTooltip('Add to favorites').first);
    await tester.pump();
    await openHeadphones(tester);

    await tester.ensureVisible(find.text('Go Back'));
    await tester.tap(find.text('Go Back'));
    await tester.pumpAndSettle();

    expect(find.byType(DetailScreen), findsNothing);
    expect(find.byTooltip('Remove from favorites'), findsOneWidget);

    await tester.tap(find.text('Favorites').last);
    await tester.pump();
    expect(find.text(headphones.title), findsOneWidget);
  });
}
