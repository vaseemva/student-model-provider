import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_record_provider/providers/students_provider.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
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
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  _name = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age'),
                onChanged: (value) {
                  _name = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please enter Age';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Batch'),
                onChanged: (value) {
                  _name = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please enter your Batch';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Domain'),
                onChanged: (value) {
                  _name = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please enter Domain';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    onAddButton();
                  },
                  child: const Text('Add'))
            ]),
          ),
        ));
  }

  onAddButton() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      Provider.of<StudentProvider>(context, listen: false)
          .addStudent(_name!, _age!, _batch!, _domain!);
      Navigator.of(context).pop();
    }
  }
}
