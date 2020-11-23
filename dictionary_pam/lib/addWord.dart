import 'package:dictionary_pam/word.dart';
import 'package:flutter/material.dart';

import 'dbhelper.dart';

class AddWord extends StatefulWidget {


  @override
  _AddWordPageState createState() => _AddWordPageState();

}

class _AddWordPageState extends State<AddWord> {

  TextEditingController wordEngController = new TextEditingController();
  TextEditingController wordPlController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dodaj nowe słowo"),
        ),
        body: Column(
          children: [
            TextField(
                controller: wordEngController,
                decoration: InputDecoration(
                  labelText: 'Słówko'
          )),
            TextField(
                controller: wordPlController,
                decoration: InputDecoration(
                    labelText: 'Tłumaczenie'
            )),
            TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: 'Opcjonalnie',
                    labelText: 'Opis'
            )),
            MaterialButton(
              onPressed: () {
                var helper = DbHelper();
                helper.insertWord(new Word(
                    id: 0,
                    wordEng: wordEngController.text,
                    wordPl: wordPlController.text,
                    description: descriptionController.text));
                Navigator.pop(context);
              },
              child: IconButton(
                icon: new Icon(Icons.add)),
            )
          ],
        )
    );
  }

}