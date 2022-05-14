import 'package:flutter/material.dart';
import './medicament.dart';
import '../navigation.dart' as navigation;
import 'package:flupteka_app/header.dart';
import '../menu.dart';

class AidKitPage extends StatefulWidget {
  const AidKitPage({Key? key}) : super(key: key);

  @override
  State<AidKitPage> createState() => _AidKitPageState();
}

class _AidKitPageState extends State<AidKitPage> {
  List<String> _medicineNames = [];
  List<int> _medicineQuantities = [];
  late final int count;

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
      appBar: const Header(
        hasMenu: true,
        title: 'MEDICAMENTS',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF55AA96)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                onPressed: () => {
                  Navigator.pushNamed(
                    context,
                    navigation.addMedicine,
                  )
                },
                child: const Text('ADD NEW'),
              )),
          Expanded(
            child: ListView(
              children: _medicineNames.asMap().entries.map((entry) {
                int ind = entry.key;
                String name = entry.value;

                return Medicament(
                  name: name,
                  count: _medicineQuantities[ind],
                  onAdd: () => setState(() => _medicineQuantities[ind] += 1),
                  onRemove: () => setState(() => _medicineQuantities[ind] == 0
                      ? 0
                      : _medicineQuantities[ind] -= 1),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      drawer: const HamburgerMenu(),
    );
  }
}

class Storage {
  List<String> loadNames() => ['Otezla', 'Aspirin', 'Analgin'];

  List<int> loadQuantities() => [5, 50, 22];

  void storeNames(List<String> names) => {};

  void storeQuantities(List<int> names) => {};
}
