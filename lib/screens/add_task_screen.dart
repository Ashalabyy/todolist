import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../services/guid_gen.dart';

class AddTaskScreen extends StatelessWidget {
  // const AddTaskScreen({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String? title;
  String? descreption;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Add Task',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: TextField(
            autofocus: true,
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        TextField(
          autofocus: true,
          onChanged: (value) {
            descreption = value;
          },
          minLines: 3,
          maxLines: 5,
          decoration: InputDecoration(
            label: Text('Description'),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                var task = Tasks(
                  title: title!,
                  description: descreption!,
                  id: GUIDGen.generate(),
                  date: DateTime.now().toString(),
                );
                context.read<TasksBloc>().add(AddTask(task: task));
                context.read<TasksBloc>().add(GetAllTasks());
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _buildDescreption() {
    return TextField(
      autofocus: true,
      controller: descriptionController,
      minLines: 3,
      maxLines: 5,
      decoration: InputDecoration(
        label: Text('Description'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
