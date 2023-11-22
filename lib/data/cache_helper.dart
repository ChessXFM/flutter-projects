import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoproject/todo/data/todo.dart';


class CacheHelper {
  static late final SharedPreferences _sharedPreferences;
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

//!  dealing with TODOS   !//
  static Future<void> setTodo(Todo todo) async {
    var num = await getNumberOfTodos();
    num++;
    todo.id = num;
    List<String>? ids = _sharedPreferences.getStringList("TODOS_IDS");
    if (ids != null) {
      ids.add('${todo.id}');
    } else {
      ids = ['${todo.id}'];
    }
    _sharedPreferences.setStringList("TODOS_IDS", ids);
    _sharedPreferences.setString("TODO$num", json.encode(todo.toJson(todo)));
    _sharedPreferences.setInt("NUMBER_OF_TODOS", num);
  }

  static Future<void> removeTodo(int id) async {
    _sharedPreferences.remove('TODO$id');
    List<String>? ids = _sharedPreferences.getStringList('TODOS_IDS');
    ids!.remove(id.toString());
    _sharedPreferences.setStringList('TODOS_IDS', ids);
  }

  static Future<int> getNumberOfTodos() async {
    int? num = _sharedPreferences.getInt("NUMBER_OF_TODOS");
    num ??= 0;
    return num;
  }

  static Future<List<Todo>> getAllTodos() async {
    List<String>? ids = _sharedPreferences.getStringList("TODOS_IDS");
    List<Todo> allTodos = [];
    if (ids != null) {
      for (String id in ids) {
        allTodos.add(Todo.fromJson(
            json.decode(_sharedPreferences.getString("TODO$id")!)));
      }
      return allTodos;
    } else {
      return allTodos;
    }
  }

//!  dealing with THEME   !//
  Future<void> cacheTheme(int index) async {
    _sharedPreferences.setInt("THEME_INDEX", index);
  }

  Future<int> getCachedTheme() async {
    final cachedThemeIndex = _sharedPreferences.getInt("THEME_INDEX");
    if (cachedThemeIndex == null) {
      return 0;
    } else {
      return cachedThemeIndex;
    }
  }
}
