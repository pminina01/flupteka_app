import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flupteka_app/contacts.dart';


void main() {
  testWidgets("Tester's name in contacts :)", (WidgetTester tester) async {
    final widget = wrapWidget(const Contacts());
    await tester.pumpWidget(widget);

    expect(find.textContaining('Anatoliy'), findsWidgets);
  });
}


Widget wrapWidget(Widget w) {
  return MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => Scaffold(body: w)},
  );
}
