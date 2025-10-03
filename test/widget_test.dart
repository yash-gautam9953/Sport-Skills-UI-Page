// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:sports_skills_app/main.dart';

void main() {
  testWidgets('Sports Skills App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SportsSkillsApp());

    // Wait for loading to complete
    await tester.pumpAndSettle();

    // Verify that the app title is displayed
    expect(find.text('Sports Skills'), findsOneWidget);

    // Verify that skill levels are displayed
    expect(find.text('Basic'), findsOneWidget);
    expect(find.text('Intermediate'), findsOneWidget);
    expect(find.text('Advanced'), findsOneWidget);
  });
}
