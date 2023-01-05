import 'package:flutter/material.dart';
import 'package:student_record_provider/models/student_model.dart';
import 'package:student_record_provider/screens/student_detail/widgets/student_detail.dart';

class StudentDetailScreen extends StatelessWidget {
const StudentDetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final student = ModalRoute.of(context)!.settings.arguments as StudentList;
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name.toString()),
      ),
      body: StudentDetail(student: student),
    );
  }
}

