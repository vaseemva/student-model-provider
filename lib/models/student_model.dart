import 'package:hive_flutter/hive_flutter.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentList extends HiveObject {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? age;

  @HiveField(2)
  final String? batch;

  @HiveField(3)
  final String? domain;

  
  StudentList(
      {required this.name,
      required this.age,
      required this.batch,
      required this.domain,
      });
}
