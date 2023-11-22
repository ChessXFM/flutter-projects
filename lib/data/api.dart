//! this file is created for testing api .. it is not used in the app !// 


// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:todo/todo/data/todo.dart';

// class TodoApi {
//   final String url = 'https://jsonplaceholder.typicode.com/todos';
  
//   Future<List<Todo>> getTodoList() async {
//     try {
//       var respone = await http.get(Uri.parse(url));
//       List<Todo> todos = (json.decode(respone.body))
//           .map<Todo>((jsonTodo) => Todo.fromJson(jsonTodo))
//           .toList();
//           return todos;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
