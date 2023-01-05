import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:student_record_provider/providers/students_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<StudentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: ListView.builder(
          itemCount: students.students.length,
          itemBuilder: (context, index) {
            if (students.students.isEmpty) {
              return const Center(
                child: Text('No students'),
              );
            }
            return ListTile(
              leading: const CircleAvatar(),
              title: Text(students.students[index].name!),
              subtitle: Text(students.students[index].batch!),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        label:const Text('Add student'),
        onPressed: () {},

      ),
    );
  }
}
