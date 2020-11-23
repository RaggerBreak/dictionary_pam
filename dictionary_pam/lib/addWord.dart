import 'package:dictionary_pam/word.dart';
import 'package:flutter/material.dart';

import 'dbhelper.dart';

class AddWord extends StatefulWidget {

  @override
  _AddWordPageState createState() => _AddWordPageState();

}

class _AddWordPageState extends State<AddWord> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dodaj tłumaczenie"),
        ),
        body: AddWordForm(),
    );
  }
}

class AddWordForm extends StatefulWidget {
  @override
  AddWordFormState createState() {
    return AddWordFormState();
  }
}
class AddWordFormState extends State<AddWordForm> {

  TextEditingController wordEngController = new TextEditingController();
  TextEditingController wordPlController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              controller: wordEngController,
              decoration: InputDecoration(
                  labelText: 'Słówko'
              ),
                validator: (value) {
                if (value.isEmpty) {
                  return 'Proszę podać słówko';
                }
                return null;
              }),
          TextFormField(
              controller: wordPlController,
              decoration: InputDecoration(
                  labelText: 'Tłumaczenie'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Proszę podać tłumaczenie';
                }
                return null;
              }),
          TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: 'Opcjonalnie',
                  labelText: 'Opis'
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  var helper = DbHelper();
                  helper.insertWord(new Word(
                      id: 0,
                      wordEng: wordEngController.text,
                      wordPl: wordPlController.text,
                      description: descriptionController.text));
                  Navigator.pop(context);
                }
              },
              child: Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
