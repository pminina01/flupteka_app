import 'package:flutter/material.dart';
import './medicament.dart';

class AidKitPage extends StatelessWidget {
  const AidKitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: const [
            Medicament(name: "paracetomol", count: 5),
            Medicament(name: "Aboba", count: 228),
            Medicament(name: "Kek", count: 22),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
