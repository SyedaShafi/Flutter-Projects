part of 'todo_bloc.dart';

class Todo {
  final String taskName;
  final bool isCompleted;
  Todo({required this.taskName, this.isCompleted = false});

  Todo copyWith({String? taskName, bool? isCompleted}) {
    return Todo(
      taskName: taskName ?? this.taskName,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class TodoState extends Equatable {
  final List<Todo> todos;
  final bool isRefreshed;

  const TodoState({
    this.todos = const [],
    this.isRefreshed = false,
  });

  TodoState copyWith({List<Todo>? todos, bool? isRefreshed}) {
    return TodoState(
      todos: todos ?? this.todos,
      isRefreshed: isRefreshed ?? this.isRefreshed,
    );
  }

  @override
  List<Object> get props => [todos, isRefreshed];
}
