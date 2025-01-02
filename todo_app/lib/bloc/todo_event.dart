part of 'todo_bloc.dart';

class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class IsRefreshedEvent extends TodoEvent {}

class AddTaskEvent extends TodoEvent {
  final String taskName;

  const AddTaskEvent({required this.taskName});
}

class DeleteTaskEvent extends TodoEvent {
  final int index;
  const DeleteTaskEvent({required this.index});
}

class ToggleTaskEvent extends TodoEvent {
  final int index;
  const ToggleTaskEvent({required this.index});
}

class EditTaskEvent extends TodoEvent {
  final int index;
  final String taskName;
  const EditTaskEvent({required this.index, required this.taskName});
}
