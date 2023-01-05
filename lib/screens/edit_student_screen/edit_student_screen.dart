import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_record_provider/models/student_model.dart';
import 'package:student_record_provider/providers/students_provider.dart';

class EditStudentScreen extends StatelessWidget {
  EditStudentScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final student = ModalRoute.of(context)!.settings.arguments as StudentList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              initialValue: student.name,
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                student.name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: student.age,
              decoration: const InputDecoration(labelText: 'Age'),
              onChanged: (value) {
                student.age = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Age';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: student.batch,
              decoration: const InputDecoration(labelText: 'Batch'),
              onChanged: (value) {
                student.batch = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Batch';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: student.domain,
              decoration: const InputDecoration(labelText: 'Domain'),
              onChanged: (value) {
                student.domain = value;
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
                onEditButton(context, student);
              },
              child: const Text('Edit'),
            )
          ]),
        ),
      ),
    );
  }

  onEditButton(BuildContext context, StudentList studentList) {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      Provider.of<StudentProvider>(context, listen: false)
          .updateStudent(studentList);
      Navigator.of(context).pop();
    }
  }
}
