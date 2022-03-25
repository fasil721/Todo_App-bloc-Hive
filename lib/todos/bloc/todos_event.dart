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
