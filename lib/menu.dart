import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'navigation.dart' as navigation;

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({Key? key}) : super(key: key);

  @override
  State<HamburgerMenu> createState() => _HamburgerMenu();
}

class _HamburgerMenu extends State<HamburgerMenu>
    with TickerProviderStateMixin {
  ParticleOptions particles = const ParticleOptions(
      baseColor: Colors.white,
      spawnOpacity: 0.3,
      opacityChangeRate: 0.8,
      minOpacity: 0.3,
      maxOpacity: 0.4,
      particleCount: 30,
      spawnMaxRadius: 7.0,
      spawnMinRadius: 2.0,
      spawnMaxSpeed: 10.0,
      spawnMinSpeed: 5);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF55AA96),
      child: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "FLUPTEKA",
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
                onTap: () => Navigator.pushNamed(context, navigation.aidKit)),
            ListTile(
                title: const Text(
                  "Notifications",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () =>
                    Navigator.pushNamed(context, navigation.notifications)),
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
                onTap: () => Navigator.pushNamed(context, navigation.contacts)),
          ],
        ),
      ),
    );
  }
}
