import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'header.dart';
import './menu.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        hasMenu: true,
        title: "Contacts",
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

  Widget _listOfContent() {
    return ListView(
      children: [
        _rowOfContent('Polina Minina', 'JohnDenkis'),
        _rowOfContent('Anatoliy Baskakov', 'Nihon_V'),
        _rowOfContent('Nurdaulet Kunkhozhaev', 'Homo_Sapiens_KN'),
        _rowOfContent('Polina Romanenkova', 'stereopolina'),
      ],
    );
  }

  Widget _rowOfContent(name, alias) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white)),
      ),
      child: _content(name, alias),
    );
  }

  Widget _content(name, alias) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(height: 10),
        _hyperLink(alias),
      ],
    );
  }

  Widget _hyperLink(alias) {
    return InkWell(
      child: Text(
        '@$alias',
        style: const TextStyle(
            color: Color(0x8A000000), fontSize: 22, letterSpacing: 6),
      ),
      onTap: () => launch('https://t.me/$alias'),
    );
  }
}
