import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/cubit/theme_cubit.dart';
import 'package:todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(IsRefreshedEvent());
  }

  void editTaskDialog(int index, String taskName) {
    _controller.text = taskName;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Task"),
          content: TextField(
            controller: _controller,
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
                context.read<TodoBloc>().add(
                    EditTaskEvent(index: index, taskName: _controller.text));
                _controller.clear();
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
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        title: const Text(
          'Simple Todo',
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, todoState) {
          return Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          context.read<TodoBloc>().add(IsRefreshedEvent());
                        },
                        label: Icon(
                          Icons.refresh,
                          color: Theme.of(context).colorScheme.surfaceTint,
                          size: 40,
                        ),
                      ),
                      BlocBuilder<ThemeCubit, ThemeState>(
                        builder: (context, themeState) {
                          return Switch(
                            value: themeState.isDarkMode,
                            onChanged: (value) {
                              context.read<ThemeCubit>().toggleTheme();
                            },
                          );
                        },
                      )
                    ],
                  ),
                  if (todoState.isRefreshed)
                    const SizedBox.shrink()
                  else if (todoState.todos.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount: todoState.todos.length,
                        itemBuilder: (context, index) {
                          final todo = todoState.todos[index];
                          return TodoList(
                            taskName: todo.taskName,
                            taskCompleted: todo.isCompleted,
                            onChanged: (value) => context
                                .read<TodoBloc>()
                                .add(ToggleTaskEvent(index: index)),
                            deleteFunction: (context) => context
                                .read<TodoBloc>()
                                .add(DeleteTaskEvent(index: index)),
                            onEdit: (context) =>
                                editTaskDialog(index, todo.taskName),
                          );
                        },
                      ),
                    )
                  else
                    const Center(
                      child: Text('Error'),
                    )
                ],
              ),
              if (todoState.isRefreshed)
                SizedBox(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  width: MediaQuery.of(context).size.width,
                  child: const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
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
                    height: 2.1,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Add a new todo items...',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                context
                    .read<TodoBloc>()
                    .add(AddTaskEvent(taskName: _controller.text));
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
