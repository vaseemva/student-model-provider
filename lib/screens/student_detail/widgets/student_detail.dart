import 'package:flutter/material.dart';
import 'package:student_record_provider/models/student_model.dart';

class StudentDetail extends StatelessWidget {
  const StudentDetail({
    Key? key,
    required this.student,
  }) : super(key: key);

  final StudentList student;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(shrinkWrap: true, children: [
         const CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: Image(image: AssetImage('assets/R.png')),
              ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            children: [
              Text(
                'Name : ${student.name}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              Text(
                'Age : ${student.age}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              Text(
                'Batch : ${student.batch}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              Text(
                'Domain : ${student.domain}',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        )
      ]),
    );
  }
}