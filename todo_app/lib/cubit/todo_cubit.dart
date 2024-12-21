import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
      : super(
          TodoState(
            todos: [
              Todo(taskName: 'Learn Web development'),
              Todo(taskName: 'Learn Flutter'),
              Todo(taskName: 'Learn dart'),
              Todo(taskName: 'Create apps'),
              Todo(taskName: 'Create more apps'),
            ],
          ),
        );
  void addTask(String taskName) {
    if (taskName.trim().isEmpty) return;
    emit(
      state.copyWith(
        todos: [...state.todos, Todo(taskName: taskName)],
      ),
    );
  }

  void deleteTask(int index) {
    final updatedTodos = List<Todo>.from(state.todos)..removeAt(index);
    emit(state.copyWith(todos: updatedTodos));
  }

  void toggleTask(int index) {
    final updatedTodos = state.todos.map((todo) {
      if (state.todos.indexOf(todo) == index) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: updatedTodos));
  }

  void editTask(int index, String newTaskName) {
    final updatedTodos = state.todos.map((todo) {
      if (state.todos.indexOf(todo) == index) {
        return todo.copyWith(taskName: newTaskName);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: updatedTodos));
  }
}
