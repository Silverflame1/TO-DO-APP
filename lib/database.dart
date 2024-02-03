import 'package:hive/hive.dart';

class ToDoDatabase{

  List toDoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData(){
    toDoList = [
      ["ADD YOUR NEW TASK", false],
    ];
  }

  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData(){
    _myBox.put("TODOLIST", toDoList);
  }
}