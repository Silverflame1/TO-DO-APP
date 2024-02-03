import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:untitled2/ToDoList.dart';
import 'package:untitled2/database.dart';
import 'package:untitled2/dialog_box.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState(){
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();


  void checkBoxChange(bool? value, int index){
    setState((){
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask(){
    setState((){
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {

        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState((){
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center(child: Text(" Activities ")),
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskComplete: db.toDoList[index][1],
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunction: (context) => deleteTask(index),
          );

        },
      )
    );

  }
}
