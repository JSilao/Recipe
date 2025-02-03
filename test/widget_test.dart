import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projects/screens/menu_plan_screen.dart'; // Import your MenuPlanScreen widget here

void main() {
  testWidgets('MenuPlanScreen widget test', (WidgetTester tester) async {
    // Build the MenuPlanScreen widget
    await tester.pumpWidget(MaterialApp(home: MenuPlanScreen()));

    // Verify that the app bar with title "Meal Plan" is visible
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Meal Plan'), findsOneWidget);

    // Verify that the week navigation controls are present
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);

    // Verify the week range is displayed
    expect(find.textContaining('Feb 3 - Feb 9'), findsOneWidget); // Adjust based on your initial start date

    // Check that the meal plan cards are displayed for each day of the week
    expect(find.text('Monday'), findsOneWidget);
    expect(find.text('Tuesday'), findsOneWidget);
    expect(find.text('Wednesday'), findsOneWidget);
    expect(find.text('Thursday'), findsOneWidget);
    expect(find.text('Friday'), findsOneWidget);
    expect(find.text('Saturday'), findsOneWidget);
    expect(find.text('Sunday'), findsOneWidget);

    // Tap the "Add Meal" button and verify that the bottom sheet opens
    await tester.tap(find.text('+ Add Meal').first); // Tapping the first "Add Meal"
    await tester.pumpAndSettle();

    // Verify that the meal selection bottom sheet is displayed
    expect(find.byType(MealSelectionSheet), findsOneWidget);
  });
}
