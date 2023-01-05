import 'package:hive_flutter/hive_flutter.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentList extends HiveObject {
  @HiveField(0)
   String? name;

  @HiveField(1)
   String? age;

  @HiveField(2)
  String? batch;

  @HiveField(3)
   String? domain;

  @HiveField(4)
  String? id; 

  
  StudentList(
      {required this.name,
      required this.age,
      required this.batch,
      required this.domain,
      required this.id
      });
}
