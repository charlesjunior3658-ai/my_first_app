import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:my_first_app/main.dart';

void main() {
  testWidgets('App builds and shows a Scaffold', (WidgetTester tester) async {
    await tester.pumpWidget(const CardApp());

    expect(find.byType(Scaffold), findsOneWidget);
  });
}