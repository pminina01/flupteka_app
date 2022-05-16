import 'package:flutter/material.dart';
import 'header.dart';
import './menu.dart';

class Notifics extends StatefulWidget {
  const Notifics({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Notifics> {
  final List<String> tablets = [];
  final List<String> times = [];
  TextEditingController tabletController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void addItemToList() {
    if (tabletController.text!='' && timeController.text!='' ){
    setState(() {
      tablets.insert(0, tabletController.text);
      times.insert(0, timeController.text);
    });}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        hasMenu: true,
        title: 'NOTIFICATIONS',
      ),
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              TextField(
                controller: timeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Time in format HH:MM',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: tabletController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tablet name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(margin:const EdgeInsets.all(15),child:
              ElevatedButton(
                child: const Text('ADD'),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF55AA96)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                onPressed: () {
                  addItemToList();
                },
              ),),
              Expanded(
                  child: ListView.builder(
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
    children: [
      SizedBox(
        width: 120,
        child: Text(time),
      ),
      Expanded(child: Text(name)),
    ],
  );
}
