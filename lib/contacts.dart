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
        title: 'CONTACTS',
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
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: Color(0xFF55AA96),
            width: 2
          ),
        color: Color(0xFF55AA96).withOpacity(0.5)

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
        'tg: @$alias',
        style: const TextStyle(
            color: Color(0x8A000000), fontSize: 22, letterSpacing: 3),
      ),
      onTap: () => _launch(Uri.parse('https://t.me/$alias')),
    );
  }
}
Future<void> _launch(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  }
}
