import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<IsRefreshedEvent>(_loadState);
    on<AddTaskEvent>(_addTask);
    on<EditTaskEvent>(_editTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<ToggleTaskEvent>(_toggleTask);
  }

  void _loadState(IsRefreshedEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(
      isRefreshed: true,
    ));

    if (state.todos.isNotEmpty) {
      final previousTodos = state.todos;

      // print('isRefreshed clicked');
      // print(state.isRefreshed);

      await Future.delayed(const Duration(seconds: 2));

      // print('After 2 seconds');
      // print(state.isRefreshed);

      emit(state.copyWith(
        todos: previousTodos,
        isRefreshed: false,
      ));
      return;
    }

    await Future.delayed(const Duration(seconds: 2));

    final List<Todo> todos = [
      Todo(taskName: 'task1'),
      Todo(taskName: 'task2'),
    ];

    emit(state.copyWith(
      todos: todos,
      isRefreshed: false,
    ));
  }

  void _addTask(AddTaskEvent event, Emitter<TodoState> emit) {
    if (state.todos.isNotEmpty && event.taskName.trim().isNotEmpty) {
      emit(state
          .copyWith(todos: [...state.todos, Todo(taskName: event.taskName)]));
    }
  }

  void _editTask(EditTaskEvent event, Emitter<TodoState> emit) {
    if (state.todos.isNotEmpty && event.taskName.trim().isNotEmpty) {
      final updatedTodos = state.todos.map((todo) {
        if (state.todos.indexOf(todo) == event.index) {
          return todo.copyWith(taskName: event.taskName);
        }
        return todo;
      }).toList();
      emit(state.copyWith(todos: updatedTodos));
    }
  }

  void _deleteTask(DeleteTaskEvent event, Emitter<TodoState> emit) {
    if (state.todos.isNotEmpty) {
      final updatedTodos = List<Todo>.from(state.todos);
      updatedTodos.removeAt(event.index);

      emit(state.copyWith(todos: updatedTodos));
    }
  }

  void _toggleTask(ToggleTaskEvent event, Emitter<TodoState> emit) {
    if (state.todos.isNotEmpty) {
      final updatedTodos = state.todos.map((todo) {
        if (state.todos.indexOf(todo) == event.index) {
          return todo.copyWith(isCompleted: !todo.isCompleted);
        }
        return todo;
      }).toList();
      emit(state.copyWith(todos: updatedTodos));
    }
  }

 
}
