import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  List ToDoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    ToDoList = [
      ["Aruman Salik", false],
      ["Do HomeWork", false],
    ];
  }

  void loadData() {
    ToDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", ToDoList);
  }
}
