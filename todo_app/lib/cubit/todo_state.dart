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
  @override
  List<Object?> get props => [];
}

class TodoLoadingState extends TodoState{

}

class TodoLoadedState extends TodoState {
  final List<Todo> todos;
  final List<Todo> archivedTodos;
  
  TodoLoadedState({required this.todos, required this.archivedTodos});

  TodoLoadedState copyWith({List<Todo>? todos, List<Todo>? archivedTodos}) {
    return TodoLoadedState(
      todos: todos ?? this.todos,
      archivedTodos: archivedTodos ?? this.archivedTodos,
    );
  }

  @override
  List<Object?> get props => [todos];
}



// class TodoState extends Equatable {
//   final List<Todo> todos;
//   final List<Todo> archivedTodos;

//   const TodoState({required this.todos, required this.archivedTodos});

//   TodoState copyWith({List<Todo>? todos, List<Todo>? archievedTodos}) {
//     return TodoState(
//       todos: todos ?? this.todos,
//       archivedTodos: archievedTodos ?? this.archivedTodos,
//     );
//   }
//   @override
//   List<Object?> get props => [todos];
// }
