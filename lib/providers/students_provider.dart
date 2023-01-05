import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_record_provider/models/student_model.dart';

class StudentProvider with ChangeNotifier {
  final Box<StudentList> _studentBox = Hive.box<StudentList>('studentList');
  List<StudentList> studentLists = [];

  List<StudentList> get students => _studentBox.values.toList();

 

  Future<void> getStudents() async {
    var box = await Hive.openBox<StudentList>('studentList');
    // updating provider state data with  hive , and refresh the UI
    studentLists = box.values.toList();
    notifyListeners();
  }

  void addStudent(StudentList studentLis) async {
    var box = await Hive.openBox<StudentList>('studentList');
    box.add(studentLis);
    studentLists = box.values.toList();
    notifyListeners();
  }

  void editStudent(int accessKey, StudentList student) async {
    var box = await Hive.openBox<StudentList>('studentList');
    box.putAt(
      accessKey,
      student,
    );
    notifyListeners();
  }
  void updateStudent(StudentList student) {
    _studentBox.putAt(students.indexOf(student), student);
    notifyListeners();
  }

  void deleteStudent(index) async {
    _studentBox.deleteAt(index);
    notifyListeners();
  }

  void deleteStudentbyId(String id) {
  _studentBox.delete(id);
  notifyListeners();
}

  List<StudentList> getMatchingStudents(String keyword) {
    getStudents();
  return studentLists.where((student) => student.name!.contains(keyword)).toList();
  
}
}
