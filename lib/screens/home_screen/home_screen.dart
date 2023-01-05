import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_record_provider/models/student_model.dart';
import 'package:student_record_provider/providers/students_provider.dart';
import 'package:student_record_provider/screens/add_student_screen/add_student.dart';
import 'package:student_record_provider/screens/edit_student_screen/edit_student_screen.dart';
import 'package:student_record_provider/screens/search_screen/search_screen.dart';
import 'package:student_record_provider/screens/student_detail/student_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final studentspro = Provider.of<StudentProvider>(context);
    List<StudentList> studentsList = studentspro.students;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
      // body: Consumer<StudentProvider>(
      //   builder: (context, value, _) =>
       body:  ListView.builder(
            itemBuilder: (context, index) {
              // value.getStudents();
              // if (value.studentLists.isEmpty) {
              //   return const Center(
              //     child: Text(
              //       'No students',
              //       textAlign: TextAlign.center,
              //     ),
              //   );
              // }
              if (studentsList.isEmpty) {
                return const Center(
                  child: Text(
                    'No students',
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/R.png'),
                ),
                // title: Text(value.studentLists[index].name.toString()),
                // subtitle: Text(value.studentLists[index].age.toString()),
                title: Text(studentsList[index].name.toString()),
                subtitle: Text(studentsList[index].age.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditStudentScreen(),
                              settings: RouteSettings(
                                // arguments: value.studentLists[index],
                                arguments: studentsList[index],
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        )),
                    IconButton(
                        onPressed: () {
                          //  value.studentLists[index].delete();
                          studentspro.deleteStudent(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentDetailScreen(),
                      settings: RouteSettings(
                        // arguments: value.studentLists[index],
                        arguments: studentsList[index],
                      ),
                    ),
                  );
                },
              );
            },
            itemCount:
                //  value.studentLists.length,
                studentsList.length),
      // ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add student'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddStudent(),
          ));
        },
      ),
    );
  }
}
