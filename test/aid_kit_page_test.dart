import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:flupteka_app/aid-kit/aid_kit_page.dart';

import 'aid_kit_page_test.mocks.dart';


@GenerateMocks([Storage])
void main() {
  testWidgets("Change medicament values", (WidgetTester tester) async {
    final widget = wrapWidget(const AidKitPage());
    await tester.pumpWidget(widget);

    const hardcodedValue = 5;

    var storage = MockStorage();
    when(storage.loadNames()).thenReturn(["Otezla", "Aspirin", "Analgin"]);
    when(storage.loadQuantities()).thenReturn([hardcodedValue, 50, 22]);

    final finder = find.byIcon(Icons.add);
    finder.first;

    expect(find.text('$hardcodedValue'), findsOneWidget);
    expect(find.text('${hardcodedValue+1}'), findsNothing);
    
    await tester.tap(finder.first);
    await tester.pump();

    expect(find.text('$hardcodedValue'), findsNothing);
    expect(find.text('${hardcodedValue+1}'), findsOneWidget);
  });
}


Widget wrapWidget(Widget w) {
  return MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => Scaffold(body: w)},
  );
}
