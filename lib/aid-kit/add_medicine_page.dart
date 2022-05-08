import 'package:algolia/algolia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flupteka_app/header.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../algolia_application.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  State<AddMedicinePage> createState() => _AddMedicinePage();
}

class _AddMedicinePage extends State<AddMedicinePage> {
  int _count = 0;
  late DateTime _dateTime;
  final TextEditingController _searchText = TextEditingController(text: '');
  List<AlgoliaObjectSnapshot> _results = [];
  bool _searching = false;
  final Algolia _algoliaApp = AlgoliaApplication.algolia;

  _search() async {
    setState(() {
      _searching = true;
    });

    AlgoliaQuery query =
        _algoliaApp.instance.index('Posts').search(_searchText.text);
    AlgoliaQuerySnapshot querySnap = await query.getObjects();
    _results = querySnap.hits;

    setState(() {
      _searching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        hasMenu: false,
        title: 'Add medicine',
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
    );
  }

  Widget _listOfContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _row('name'),
        _row('count'),
        _row('due'),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: const Color(0xFF55AA96)),
          onPressed: () {},
          child: const Text('ADD'),
        ),
      ],
    );
  }

  Widget _row(String name) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white)),
      ),
      child: _buildChild(name),
    );
  }

  Widget _buildChild(name) {
    if (name == 'name') {
      return _contentName();
    } else if (name == 'count') {
      return _contentCount();
    } else if (name == 'due') {
      return _contentDue();
    }
    return Row();
  }

  Widget _contentName() {
    return Column(children: [
      Row(mainAxisSize: MainAxisSize.min, children: [
        const Text('Name'),
        // TypeAheadField(
        //   animationStart: 0,
        //   animationDuration: Duration.zero,
        //   textFieldConfiguration: const TextFieldConfiguration(
        //       autofocus: true,
        //       style: TextStyle(fontSize: 15),
        //       decoration: InputDecoration(
        //           border: OutlineInputBorder()
        //       )
        //   ),
        //   suggestionsBoxDecoration: SuggestionsBoxDecoration(
        //       color: Colors.lightBlue[50]
        //   ),
        //   suggestionsCallback: (pattern) {return [pattern,2,3];},
        //   itemBuilder: (context, sone) {
        //     return Card(
        //         child: Container(
        //           padding: EdgeInsets.all(10),
        //           child:Text(sone.toString()),
        //         )
        //     );
        //   },
        //   onSuggestionSelected: (suggestion) {
        //     print(suggestion);
        //   },
        // ),
        Spacer(),
        SizedBox(
          width: 200,
          height: 60,
          child: TextField(
            controller: _searchText,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: _search,
                icon: const Icon(Icons.search),
                iconSize: 30,
              ),
              border: const OutlineInputBorder(),
              hintText: 'Medicine Name',
              contentPadding: const EdgeInsets.only(left: 20.0),
              constraints: const BoxConstraints(maxWidth: 200, maxHeight: 60),
            ),
            onSubmitted: (value) {},
          ),
        ),
      ])
    ]);
  }

  Widget _contentCount() {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      const Text('Count'),
      Spacer(),
      Row(children: [
        TextButton(
          onPressed: () => setState(() => _count==0 ? 0 : _count -= 1),
          child: const Icon(Icons.remove),
        ),
        Text('$_count'),
        TextButton(
          onPressed: () => setState(() => _count += 1),
          child: const Icon(Icons.add),
        ),
      ]),
    ]);
  }

  Widget _contentDue() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      const Text('Due'),
      Spacer(),
      TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Date',
          constraints: BoxConstraints(maxWidth: 200, maxHeight: 60),
        ),
        onSubmitted: (value) {},
      ),
    ]);
  }
}
