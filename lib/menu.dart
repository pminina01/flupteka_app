import 'package:flutter/material.dart';
import 'navigation.dart' as Navigation;

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF55AA96),
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "FLUPPTEKA",
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: 'Poppins',
                  fontSize: 38,
                  letterSpacing: 6),
            ),
          ),
          ListTile(
              title: const Text(
                "First-aid kit",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pushNamed(context, Navigation.AID_KIT)),
          ListTile(
              title: const Text(
                "Notifications",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {}),
          ListTile(
              title: const Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {}),
          ListTile(
              title: const Text(
                "Contacts",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pushNamed(context, Navigation.CONTACTS)),
        ],
      ),
    );
  }

  /*Widget _listOfContent() {
    return ListView(
      children: [
        _rowOfContent('Polina Minina', 'JohnDenkis'),
        _rowOfContent('Anatoliy Baskakov', 'Nihon_V'),
        _rowOfContent('Nurdaulet Kunkhozhaev', 'Homo_Sapiens_KN'),
        _rowOfContent('Polina Romanenkova', 'stereopolina'),
      ],
    );
  }*/
}
