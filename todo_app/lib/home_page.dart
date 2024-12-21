import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  // List todoList = [
  //   ['Learn Web Development', false],
  //   ['Learn Flutter', false],
  //   ['Learn Dart', false],
  //   ['Create Apps', false],
  //   ['Create more Apps', false],
  // ];

  // void checkBoxChanged(int index) {
  //   setState(() {
  //     todoList[index][1] = !todoList[index][1];
  //   });
  // }

  // void saveNewTask() {
  //   setState(() {
  //     if (_controller.text.trim().isNotEmpty) {
  //       todoList.add([_controller.text, false]);
  //     }
  //     _controller.clear();
  //   });
  // }

  // void deleteTask(int index) {
  //   setState(() {
  //     todoList.removeAt(index);
  //   });
  // }

  void editTaskDialog(int index, String taskName) {
    final editController = TextEditingController(text: taskName);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Task"),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(
              hintText: "Enter new task name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                context.read<TodoCubit>().editTask(index, editController.text);
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text(
          'Simple Todo',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return TodoList(
                taskName: todo.taskName,
                taskCompleted: todo.isCompleted,
                onChanged: (value) =>
                    context.read<TodoCubit>().toggleTask(index),
                deleteFunction: (context) =>
                    context.read<TodoCubit>().deleteTask(index),
                onEdit: (context) => editTaskDialog(index, todo.taskName),
              );
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 10,
                ),
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(
                    color: Colors.white,
                    height: 2.1,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Add a new todo items...',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<TodoCubit>().addTask(_controller.text);
                _controller.clear();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
