import 'package:flutter/material.dart';
import 'package:flupteka_app/header.dart';

class AddMedicinePage extends StatelessWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        hasMenu: false,
        title: "Add medicine",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "Name",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30,
                ),
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Aspirin',
                    constraints: BoxConstraints(maxWidth: 200, maxHeight: 60),
                  ),
                  onSubmitted: (value) {},
                ),
              ),
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: [
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
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "Due",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30,
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '25.05',
                  constraints: BoxConstraints(maxWidth: 200, maxHeight: 60),
                ),
                onSubmitted: (value) {},
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
