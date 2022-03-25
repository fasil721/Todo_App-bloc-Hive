part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class LoadTodosEvent extends TodosEvent {
  final String usernane;

  const LoadTodosEvent(this.usernane);
  @override
  List<Object?> get props => [usernane];
}

class AddTodoEvent extends TodosEvent {
  const AddTodoEvent(this.todoText);
  final String todoText;

  @override
  List<Object?> get props => [todoText];
}

class ToggleTodoEvent extends TodosEvent {
  const ToggleTodoEvent(this.todoTask);
  final String todoTask;
  
  @override
  List<Object?> get props => [todoTask];
}
