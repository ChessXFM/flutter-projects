import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoproject/theme/data/themes.dart';
import '../../../todo/todo_bloc/todo_bloc.dart';

Widget myTile(List taskList, int index, BuildContext context) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      color:MyTheme.appColor.withOpacity(0.5),
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(taskList[index].title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(taskList[index].subtitle),
        leading: CircleAvatar(
            backgroundColor: Colors.white70,
            child: Text("${taskList[index].id}")),
        trailing: IconButton(
            onPressed: () {
              final todoBloc = BlocProvider.of<TodoBloc>(context);
              todoBloc.add(RemoveTodoEvent(id: taskList[index].id));
            },
            icon: const Icon(
              Icons.delete,
              color: Color.fromARGB(255, 240, 65, 34),
            )),
      ),
    );
