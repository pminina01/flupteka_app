import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'header.dart';
import './menu.dart';
// import './assets/images/clock.png';

class Notifics extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Notifics> {
  final List<String> tablets = <String>[
    'Aspirin',
    'Paracetamol',
    "Magnesium",
    "Magnesium"
  ];
  final List<String> times = <String>['15:00', '20:00', '21:00', '22:00'];
  TextEditingController tabletController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void addItemToList() {
    setState(() {
      tablets.insert(0, tabletController.text);
      times.insert(0, timeController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        hasMenu: true,
        title: "Notifications",
      ),
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Container(
                child: TextField(
                  controller: tabletController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tablet name',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time in format HH:MM',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('+'),
                onPressed: () {
                  addItemToList();
                },
              ),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: tablets.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _notify(times[index], tablets[index]);
                      }))
            ]),
          ),
        ),
      ),
      drawer: const HamburgerMenu(),
    );
  }
}

Widget _notify(time, name) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: Colors.white)),
    ),
    child: _contentrow(time, name),
  );
}

Widget _contentrow(time, name) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          width: 200,
          child: Row(children: [
            Positioned.fill(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'lib/assets/images/clock.png',
                      fit: BoxFit.cover,
                      height: 25,
                      width: 25,
                    ))),
            SizedBox(width: 3),
            Text(time),
          ])),
      const SizedBox(width: 10),
      Container(width: 300, child: Text(name)),
    ],
  );
}
