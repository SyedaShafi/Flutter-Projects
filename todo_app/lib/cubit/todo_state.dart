part of 'todo_cubit.dart';

class Todo {
  final String taskName;
  final bool isCompleted;

  Todo({
    required this.taskName,
    this.isCompleted = false,
  });

  Todo copyWith({String? taskName, bool? isCompleted}) {
    return Todo(
      taskName: taskName ?? this.taskName,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({this.todos = const []});

  TodoState copyWith({List<Todo>? todos}) {
    return TodoState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object?> get props => [todos];
}
