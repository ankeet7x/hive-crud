import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddToDo extends StatefulWidget {
  @override
  _AddToDoState createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
            ),
            TextField(
              controller: _detailsController,
            ),
            ElevatedButton(
                onPressed: () {
                  Hive.box<String>('todo')
                      .put(_titleController.text, _detailsController.text);
                  Navigator.pop(context);
                },
                child: Text("Add todo"))
          ],
        ),
      ),
    );
  }
}
