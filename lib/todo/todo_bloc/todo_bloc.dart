import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoproject/data/cache_helper.dart';
import '../data/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CacheHelper cacheHelper;
  TodoBloc({required this.cacheHelper}) : super(LoadingState()) {
    on<TodoEvent>((event, emit) async {
      if (event is GetAllTodosEvent) {
        emit(LoadingState());
        try {
          final todos = await CacheHelper.getAllTodos();
          emit(LoadedState(todos));
        } catch (e) {
          emit(const ErrorState("Something Went Wrong .."));
        }
      }
      else if(event is AddTodoEvent){
        emit(LoadingState());
          try {
          await CacheHelper.setTodo(event.todo);
           var todos =await CacheHelper.getAllTodos();
          emit(LoadedState(todos));
        } catch (e) {
         
          emit(const ErrorState("Something Went Wrong .."));
         
        }
      }
      else if(event is RemoveTodoEvent){
         emit(LoadingState());
          try {
          await CacheHelper.removeTodo(event.id);
           var todos =await CacheHelper.getAllTodos();
          emit(LoadedState(todos));
        } catch (e) {
         
          emit(const ErrorState("Something Went Wrong .."));
         
        }
      }
    });
  }
}
