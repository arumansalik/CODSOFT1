import 'package:flutter/material.dart';
import 'package:todo_list/ListTile/Toggle.dart';

class ListBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  ListBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ToggleBut(text: "Save", onPressed: onSave),
                const SizedBox(
                  width: 4,
                ),
                ToggleBut(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
