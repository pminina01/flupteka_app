import 'package:flutter/material.dart';
import './medicament.dart';
import '../navigation.dart' as Navigation;

class AidKitPage extends StatefulWidget {
  const AidKitPage({Key? key}) : super(key: key);

  @override
  State<AidKitPage> createState() => _AidKitPageState();
}

class _AidKitPageState extends State<AidKitPage> {
  List<String> _medicineNames = [];
  List<int> _medicineQuantities = [];

  final Storage _storage = Storage();

  @override
  void initState() {
    super.initState();
    _medicineNames = _storage.loadNames();
    _medicineQuantities = _storage.loadQuantities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: _medicineNames.asMap().entries.map((entry) {
            int ind = entry.key;
            String name = entry.value;

            return Medicament(
              name: name,
              count: _medicineQuantities[ind],
              onAdd: () => setState(() => _medicineQuantities[ind] += 1),
              onRemove: () => setState(() => _medicineQuantities[ind] -= 1),
            );
          }).toList(),
          // const [
          // Medicament(name: "paracetomol", count: 5),
          // Medicament(name: "Aboba", count: 228),
          // Medicament(name: "Kek", count: 22),
          // ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(
            context,
            Navigation.ADD_MEDICINE,
          )
        },
        tooltip: 'Add medicine',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Storage {
  List<String> loadNames() => ["Paracetomol", "Aspirin", "Analgin"];
  List<int> loadQuantities() => [5, 50, 22];

  void storeNames(List<String> names) => {};
  void storeQuantities(List<int> names) => {};
}
