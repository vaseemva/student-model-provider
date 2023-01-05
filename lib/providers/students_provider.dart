import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_record_provider/models/student_model.dart';

class StudentProvider with ChangeNotifier {
  final Box<StudentList> _studentBox = Hive.box<StudentList>('studentList');

  List<StudentList> get students => _studentBox.values.toList();

  void addStudent(
    String name,
    String age,
    String batch,
    String domain,
  ) async {
    _studentBox
        .add(StudentList(name: name, age: age, batch: batch, domain: domain));
    notifyListeners();
  }

  void editStudent(int accessKey, String name, String age, String batch,
      String domain) async {
    _studentBox.putAt(
      accessKey,
      StudentList(name: name, age: age, batch: batch, domain: domain),
    );
    notifyListeners();
  }

  void deleteStudent(index) async {
    _studentBox.deleteAt(index);
    notifyListeners();
  }
}
