import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'todo_state.dart';

// class TodoCubit extends Cubit<TodoState> {

//   TodoCubit()
//       : super(TodoState(
//           todos: [
//             Todo(taskName: 'Learn Web development'),
//             Todo(taskName: 'Learn Flutter'),
//             Todo(taskName: 'Learn dart'),
//             Todo(taskName: 'Create apps'),
//             Todo(taskName: 'Create more apps'),
//           ],
//           archivedTodos: [],
//         ));

//   void addTask(String taskName) {
//     if (taskName.trim().isEmpty) return;
//     emit(state.copyWith(todos: [...state.todos, Todo(taskName: taskName)]));
//   }

//   void deleteTask(int index) {
//     final updatedTodos = List<Todo>.from(state.todos)..removeAt(index);
//     emit(state.copyWith(todos: updatedTodos));
//   }

//   void toggleTask(int index) {
//     final updatedTodos = state.todos.map((todo) {
//       if (state.todos.indexOf(todo) == index) {
//         return todo.copyWith(isCompleted: !todo.isCompleted);
//       }
//       return todo;
//     }).toList();
//     emit(state.copyWith(todos: updatedTodos));
//   }

//   void editTask(int index, String newTaskName) {
//     final updatedTodos = state.todos.map((todo) {
//       if (state.todos.indexOf(todo) == index) {
//         return todo.copyWith(taskName: newTaskName);
//       }
//       return todo;
//     }).toList();
//     emit(state.copyWith(todos: updatedTodos));
//   }
// }

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoLoadingState()) {
    loadingState();
  }

  void loadingState() async {
    await Future.delayed(const Duration(seconds: 2));

    final todos = [
      Todo(taskName: 'Task1'),
      Todo(taskName: 'Task2'),
    ];
    
    emit(TodoLoadedState(todos: todos, archivedTodos: const []));
  }

  void addTask(String taskName) {
    if (taskName.trim().isEmpty) return;
    if (state is TodoLoadedState) {
      final curState = state as TodoLoadedState;
      final newTodos = [...curState.todos, Todo(taskName: taskName)];
      emit(curState.copyWith(todos: newTodos));
    }
  }

  void deleteTask(int index) {
    if (state is TodoLoadedState) {
      final curState = state as TodoLoadedState;
      final updatedTodos = List<Todo>.from(curState.todos)..removeAt(index);
      emit(curState.copyWith(todos: updatedTodos));
    }
  }

  void toggleTask(int index) {
    if (state is TodoLoadedState) {
      final curState = state as TodoLoadedState;
      final updatedTodos = curState.todos.map((todo) {
        if (curState.todos.indexOf(todo) == index) {
          return todo.copyWith(isCompleted: !todo.isCompleted);
        }
        return todo;
      }).toList();
      emit(curState.copyWith(todos: updatedTodos));
    }
  }

  void editTask(int index, String newTaskName) {
    if (state is TodoLoadedState) {
      final curState = state as TodoLoadedState;
      final updatedTodos = curState.todos.map((todo) {
        if (curState.todos.indexOf(todo) == index) {
          return todo.copyWith(taskName: newTaskName);
        }
        return todo;
      }).toList();
      emit(curState.copyWith(todos: updatedTodos));
    }
  }
}
