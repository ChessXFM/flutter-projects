import 'package:flutter/material.dart';
import '../../../todo/data/todo.dart';
import 'list_tile.dart';

class TodoWidget extends StatelessWidget {
  final List<Todo> todos;
  const TodoWidget({required this.todos, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Center(
                child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) =>
                        myTile(todos, index, context))),
          ),
        ],
      ),
    );
  }
}
