// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clock_app/main.dart';
import 'package:clock_app/clock/clock.dart';

void main() {
  testWidgets('Test main widget works and renders tabs', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Top level widget exists
    var appClockWidget = find.byType(AppClock);
    expect(appClockWidget, findsOneWidget);

    // TabBar exists and is rendered with its children
    var tabBar = find.byType(TabBar);
    expect(tabBar, findsOneWidget);

    var alarmTab = find.text('ALARMS');
    var recordsTab = find.text('RECORDS');
    var profileTab = find.text('PROFILE');

    expect(alarmTab, findsOneWidget);
    expect(recordsTab, findsOneWidget);
    expect(profileTab, findsOneWidget);

    // See if the clock is displayed
    expect(find.byType(Clock), findsOneWidget);

    // Tap the records tab
    await tester.tap(recordsTab);

    // Rebuild the widget after the state has changed
    await tester.pumpAndSettle();

    // See if the clock is NO LONGER displayed
    expect(find.byType(Clock), findsNothing);

    // See if the custom graph is displayed
    expect(find.byType(CustomPaint), findsWidgets);

    // Tap the records tab
    await tester.tap(profileTab);

    // Rebuild the widget after the state has changed
    await tester.pumpAndSettle();

    // See if the custom graph is NO LONGER displayed
    expect(find.byType(CustomPainter), findsNothing);

    // See if the futureBuilder is displayed
//    expect(find.byType(FutureBuilder), findsOneWidget);

  });
}
