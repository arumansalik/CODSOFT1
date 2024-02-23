import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TileList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteAction;

  TileList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteAction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontFamily: 'overpass',
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
