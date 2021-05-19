import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'addtodo.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<String>('todo').listenable(),
        builder: (context, Box<String> todos, _) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final key = todos.keys.toList()[index];
              final value = todos.get(key);
              return ListTile(
                leading: Text(index.toString()),
                title: Text(key),
                subtitle: Text(value.toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    todos.delete(key);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddToDo())),
      ),
    );
  }
}
