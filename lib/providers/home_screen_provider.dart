import 'package:flutter/material.dart';

class HomeScreenProvider with ChangeNotifier {
  Icon myIcon = const Icon(Icons.search);
  Widget myField = const Text('Students List');
  String searchInput = "";

  void toggleSearchField() {
    if (myIcon.icon == Icons.search) {
      myIcon = const Icon(Icons.clear);
      myField = TextField(
        onChanged: (value) {
          searchInput = value;
          notifyListeners();
        },
        decoration: const InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: 'Search here',
        ),
        style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
      );
    } else {
      searchInput = '';
      myIcon = const Icon(Icons.search);
      myField = const Text('Students list');
      notifyListeners();
    }
  }
}
