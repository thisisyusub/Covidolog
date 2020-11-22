import 'package:covidolog/presentation/widgets/app_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppBottomNavBar Tesr', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: AppBottomNavBar(onNavItemTapped: (selectedIndex) {
            expect(selectedIndex, selectedIndex >= 0 && selectedIndex <= 2);
          }),
        ),
      ),
    );

    final textFinder = find.byKey(ValueKey('bottomNavBar'));
    final textNotFinder = find.widgetWithText(Text, 'Xəbərlər');
    final textNotFinder2 = find.widgetWithText(Text, 'Məlumat');

    expect(textFinder, findsOneWidget);
    expect(textNotFinder, findsNothing);
    expect(textNotFinder2, findsNothing);
  });
}
