import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petly/app/theme/app_theme.dart';

void main() {
  testWidgets('Petly theme renders Material 3 content', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.theme,
        home: const Scaffold(body: Text('Petly')),
      ),
    );

    expect(find.text('Petly'), findsOneWidget);
    expect(Theme.of(tester.element(find.text('Petly'))).useMaterial3, isTrue);
  });
}
