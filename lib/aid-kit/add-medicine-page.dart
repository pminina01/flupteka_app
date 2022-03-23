import 'package:flutter/material.dart';
import 'add-medicine-form.dart';
import '../navigation.dart' as Navigation;

class AddMedicinePage extends StatelessWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(children: const [
              Text(
                "Name",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30,
                ),
              ),
              // TextField(
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: 'Aspirin',
              //     constraints: BoxConstraints(minWidth: 400, minHeight: 60),
              //   ),
              //   onSubmitted: (value) {},
              // ),
            ]),
            Row(children: [
              const Text(
                "Count",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30,
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: const Icon(Icons.remove),
              ),
              const Text(
                "20",
                style: TextStyle(fontFamily: "Poppins", fontSize: 35),
              ),
              TextButton(
                onPressed: () => {},
                child: const Icon(Icons.add),
              ),
            ]),
          ],
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
