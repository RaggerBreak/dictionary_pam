import 'package:dictionary_pam/addWord.dart';
import 'package:dictionary_pam/dbhelper.dart';
import 'package:dictionary_pam/word.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ENG - POL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Word> words = [];
  int wordsLength = 0;

  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {

    updateList();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: new Icon(Icons.add),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddWord()),
              ),
            ),
          ],
        ),
        body: buildListView());
  }

  ListView buildListView() {
    return ListView.builder(
        itemCount: words.length != null ? words.length : 0,
        itemBuilder: (context, i) => ListTile(
          title: Text(words[i].wordEng),
          subtitle: Text(words[i].wordPl),
          onTap: (null),
        ));
  }

  void updateList() {
    dbHelper.open().then((_) => dbHelper.getWords().then((value) => {
      setState(() {
        words = value;
      })
    }));
  }

}

