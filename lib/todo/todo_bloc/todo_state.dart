part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class LoadingState extends TodoState {}

class LoadedState extends TodoState {
  final List<Todo> todos;
  const LoadedState(this.todos);

  @override
  List<Object> get props => [todos];
}

class ErrorState extends TodoState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
