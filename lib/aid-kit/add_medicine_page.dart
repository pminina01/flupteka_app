import 'package:algolia/algolia.dart';
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
  //late DateTime _dateTime;
  final TextEditingController _searchText = TextEditingController(text: '');

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
    return
      Row(mainAxisSize: MainAxisSize.min, children: [
        const Text('Name'),
        const Spacer(),
        SizedBox(
        width: 190,
        child:
        TypeAheadField(
          animationStart: 0,
          animationDuration: Duration.zero,
          textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
              ),
            controller: _searchText,
          ),
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
              color: Colors.lightBlue[50]
          ),
          suggestionsCallback: (pattern){
            return _search(pattern);
            },
          itemBuilder: (context, String sone) {
            return
            ListTile(
                title: Text(sone, style: const TextStyle(fontSize: 15)),
            );
          },
          onSuggestionSelected: (suggestion) {
            _searchText.text = suggestion.toString();
          },
        ),
        ),
      ]);
  }

  Widget _contentCount() {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      const Text('Count'),
      const Spacer(),
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
      const Spacer(),
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

Future<List<String>> _search(text) async {
  List<AlgoliaObjectSnapshot> _results = [];
  List<String> _names = [];
  const Algolia _algoliaApp = AlgoliaApplication.algolia;
  AlgoliaQuery query = _algoliaApp.instance.index('medicine').query(text);
  AlgoliaQuerySnapshot querySnap = await query.getObjects();
  _results = querySnap.hits;
  for (var i = 0; i < _results.length; i++){
    var curr = _results[i].data['name'];
    _names.add(curr);
  }
  return _names;
}
