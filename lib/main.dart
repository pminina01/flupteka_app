import 'package:flutter/material.dart';
import 'aid-kit/aid_kit_page.dart';
import 'aid-kit/add_medicine_page.dart';
import './notific.dart';
import './contacts.dart';
import 'navigation.dart' as navigation;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const Contacts(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     automaticallyImplyLeading: true,
      //     //leading: IconButton(icon:Icon(Icons.arrow_back),
      //     //onPressed:() => Navigator.pop(context, false),
      //     //),
      //     elevation: 0.0,
      //     iconTheme: const IconThemeData(
      //       color: Colors.black, //change your color here
      //       size: 30,
      //     ),
      //   ),
      //   body: const Contacts(),
      //   drawer: const HamburgerMenu(),
      // ),
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
          title: "F",
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: const [Text("Implement me, pls")],
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
