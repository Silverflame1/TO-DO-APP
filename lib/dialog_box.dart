import 'package:flutter/material.dart';

import 'Button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.lightBlueAccent[100],
        content: Container(
          height: 120,
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
              controller: controller,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add New Task.....",
            ),
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyBotton(text: "Save", onPressed: onSave),
                  MyBotton(text: "Cancel", onPressed: onCancel),
                ],
              )
          ])
        )
    );
  }
}
