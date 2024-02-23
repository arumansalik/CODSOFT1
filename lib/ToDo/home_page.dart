import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/Colors/colors.dart';
import 'package:todo_list/ListTile/list_box.dart';
import 'package:todo_list/ListTile/list_tile.dart';
import 'package:todo_list/ToDo/HiveData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBOX');
  final _controller = TextEditingController();
  HiveData hd = HiveData();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      hd.createInitialData();
    } else {
      hd.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      hd.ToDoList[index][1] = !hd.ToDoList[index][1];
    });
    hd.updateDataBase();
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return ListBox(
            controller: _controller,
            onSave: SaveNewtask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void SaveNewtask() {
    setState(() {
      hd.ToDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    hd.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      hd.ToDoList.removeAt(index);
    });
    hd.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TODO ",
                style: TextStyle(
                    fontFamily: 'overpass', fontWeight: FontWeight.w800),
              ),
              Text(
                " LIST ",
                style: TextStyle(
                    color: Tcolor.primary,
                    fontFamily: 'overpass',
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          child: Icon(Icons.add),
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.builder(
            itemCount: hd.ToDoList.length,
            itemBuilder: (context, index) {
              return TileList(
                taskName: hd.ToDoList[index][0],
                taskCompleted: hd.ToDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteAction: (context) => deleteTask(index),
              );
            }));
  }
}
