import "package:flutter/material.dart";

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('To-Do List', style: TextStyle(color:
        Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('Lab - 8'),
              trailing: Checkbox(value: true, onChanged: (value) {}),
            ),
            ListTile(
              title: Text('Lab - 9'),
              trailing: Checkbox(value: false, onChanged: (value) {}),
            ),
            ListTile(
              title: Text('Lab - 10'),
              trailing: Checkbox(value: false, onChanged: (value) {}),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: Text('Add To-Do'),
      ),
    );
  }
}