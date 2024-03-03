import 'package:basic_todoapp/constants/tasktype.dart';
import 'package:basic_todoapp/model/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted
          ? Colors.grey
          : Colors
              .white, //yazi kutularina basilirsa arka plan kutusu gri olacak
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20)), //alanın etrafina shape vermek icin
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == TaskType.note
                //if yerine ternary operation kullandi
                //amaci todo maddelerine uygun madde resmini vermek
                ? Image.asset("lib/assets/images/category_1.png")
                : widget.task.type == TaskType.contest
                    ? Image.asset("lib/assets/images/category_3.png")
                    : Image.asset("lib/assets/images/category_2.png"),
            // const Icon(
            //   Icons.notes_outlined,
            //   size: 50,
            // ), //icon olusturma
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough //yazilarin uzerine cizgi cekmek icin
                            : TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                  Text(
                    widget.task.description, //tasklara description ekledi
                    style: TextStyle(
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(
                  //butona basilma kismi
                  () {
                    widget.task.isCompleted = !widget.task.isCompleted;
                    isChecked = val!;
                  },
                )
              },
            )
          ],
        ),
      ),
    );
  }
}
