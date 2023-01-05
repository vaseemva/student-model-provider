import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_record_provider/models/student_model.dart';
import 'package:student_record_provider/providers/students_provider.dart';

class AddStudent extends StatelessWidget {
  AddStudent({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  String? _name;

  String? _age;

  String? _domain;

  String? _batch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Student'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  _name = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age'),
                onChanged: (value) {
                  _age = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Age';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Batch'),
                onChanged: (value) {
                  _batch = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Batch';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Domain'),
                onChanged: (value) {
                  _domain = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Domain';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    onAddButton(context);
                  },
                  child: const Text('Add'))
            ]),
          ),
        ));
  }

  onAddButton(BuildContext context) {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      Provider.of<StudentProvider>(context, listen: false).addStudent(
          StudentList(
              name: _name,
              age: _age,
              batch: _batch,
              domain: _domain,
              id: DateTime.now().toString()));
      Navigator.of(context).pop();
    }
  }
}
