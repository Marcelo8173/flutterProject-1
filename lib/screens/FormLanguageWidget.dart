// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_app/models/languages.dart';

import '../component/inputForm.dart';

class FormLanguageWidget extends StatefulWidget {
  const FormLanguageWidget({super.key});

  @override
  State<FormLanguageWidget> createState() => _FormLanguageWidgetState();
}

class _FormLanguageWidgetState extends State<FormLanguageWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _detailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adicionando uma linguagem'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ignore: prefer_const_constructors
                    InputFormComponet(
                      labelText: 'Nome da linguagem',
                      placeholder: 'Nome da linguagem',
                      controller: _nameController,
                    ),
                    // ignore: prefer_const_constructors
                    InputFormComponet(
                      labelText: 'Detalhe da linguagem',
                      placeholder: 'Detalhe da linguagem',
                      controller: _detailController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                          child: const Text('Gravar'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Language language = Language(
                                  _nameController.text, _detailController.text);
                              Navigator.pop(context, language);
                            }
                          }),
                    )
                  ])),
        ));
  }
}
