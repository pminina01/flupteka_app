import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'header.dart';
import './menu.dart';
// import './assets/images/clock.png';

class Notifics extends StatelessWidget {
  const Notifics({Key? key}) : super(key: key);
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
            child: _listOfContent(),
          ),
        ),
      ),
      drawer: const HamburgerMenu(),
    );
  }
}

Widget _listOfContent() {
  return ListView(
    children: [
      _notify('15:00', 'Aspirin'),
      _notify('20:00', 'Paracetamol'),
      _notify('21:00', 'Magnesium'),
      _notify('22:00', 'Magnesium'),
    ],
  );
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
