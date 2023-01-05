import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_record_provider/models/student_model.dart';
import 'package:student_record_provider/providers/students_provider.dart';
import 'package:student_record_provider/screens/edit_student_screen/edit_student_screen.dart';
import 'package:student_record_provider/screens/student_detail/student_detail_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<StudentProvider>(context);
    List<StudentList> hh = students.getMatchingStudents(_searchController.text);
    return Scaffold(
        appBar: AppBar(
          title: SearchBar(searchController: _searchController),
        ),
        body: _searchController.text.isEmpty
            ? const Center(
                child: Text('Enter a search keyword'),
              )
            : ListView.builder(
                itemCount: hh.length,
                itemBuilder: (context, index) {
                  // return ListTile(
                  //     title: Text(hh[index].name.toString()),
                  //     subtitle: Text(hh[index].age.toString()));
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/R.png'),
                    ),
                    // title: Text(value.studentLists[index].name.toString()),
                    // subtitle: Text(value.studentLists[index].age.toString()),
                    title: Text(hh[index].name.toString()),
                    subtitle: Text(hh[index].age.toString()),
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
                                    arguments: hh[index],
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
                              students.deleteStudent(
                                  students.students.indexOf(hh[index]));
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
                            arguments: hh[index],
                          ),
                        ),
                      );
                    },
                  );
                }));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: const InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search here',
      ),
    );
  }
}
