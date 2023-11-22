part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}
class GetAllTodosEvent extends TodoEvent{}
class AddTodoEvent extends TodoEvent{
final Todo todo;
const AddTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}
class RemoveTodoEvent extends TodoEvent{
final int id;
const RemoveTodoEvent({required this.id});

  @override
  List<Object> get props => [id];
}