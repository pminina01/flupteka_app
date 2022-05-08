import 'package:flutter/material.dart';
import 'aid-kit/aid_kit_page.dart';
import 'aid-kit/add_medicine_page.dart';
import './notific.dart';
import './contacts.dart';
import './aid-kit/aid_kit_page.dart';
import 'navigation.dart' as navigation;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const AidKitPage(),
      theme: ThemeData(
        primaryColor: const Color(0xFFC5DADA),
        backgroundColor: const Color(0xFFC5DADA),
        scaffoldBackgroundColor: const Color(0xFFC5DADA),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: TextStyle(
            fontSize: 28,
            letterSpacing: 6,
            fontWeight: FontWeight.normal,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFC5DADA),
        ),
      ),
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) {
        return const MyHomePage(
          title: 'F',
        );
      }),
      onGenerateRoute: (settings) {
        if (settings.name == navigation.aidKit) {
          return MaterialPageRoute(
            builder: (context) => const AidKitPage(),
          );
        }
        if (settings.name == navigation.addMedicine) {
          return MaterialPageRoute(
            builder: (context) => const AddMedicinePage(),
          );
        }
        if (settings.name == navigation.notifications) {
          return MaterialPageRoute(
            builder: (context) => const Notifics(),
          );
        }

        if (settings.name == navigation.contacts) {
          return MaterialPageRoute(builder: (context) => const Contacts());
        }
        return null;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: const [Text('Implement me, pls')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, navigation.aidKit)},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
