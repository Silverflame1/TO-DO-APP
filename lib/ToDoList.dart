import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({super.key,
    required this.taskName,
    required this.taskComplete,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child:Row(
              children: [
                Checkbox(value: taskComplete, onChanged: onChanged,
                activeColor: Colors.black,),
                SizedBox(
                  width: 240.0,
                  child: Text(taskName,
                  overflow: TextOverflow.fade, softWrap: false,
                  style: TextStyle(
                      decoration: taskComplete ?
                      TextDecoration.lineThrough :
                      TextDecoration.none,color: Colors.white,fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

