import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flupteka_app/aid-kit/medicament.dart';


Directionality wrapWidget(Widget w) {
  return Directionality(
    child: MediaQuery(
      data: const MediaQueryData(),
      child: w,
    ),
    textDirection: TextDirection.ltr,
  );
}

void main() {
  testWidgets('Medicament shows name and amount', (WidgetTester tester) async {
    final widget = wrapWidget(const Medicament(name: "Lekarstvo", count: 20));
    await tester.pumpWidget(widget);

    expect(find.text('Lekarstvo'), findsOneWidget);
    expect(find.text('${20}'), findsOneWidget);
    expect(find.text('${21}'), findsNothing);
  });

  testWidgets('Medicament callbacks work', (WidgetTester tester) async {
    var check = false;

    final widget = wrapWidget(Medicament(name: "Lekarstvo", count: 20, onAdd: () => {check = true}));
    await tester.pumpWidget(widget);

    await tester.tap(find.byIcon(Icons.add));
    expect(check, true);
  });
}



// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }