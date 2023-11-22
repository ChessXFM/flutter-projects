import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoproject/screens/home/home.dart';
import 'package:todoproject/todo/data/todo.dart';


import '../../todo/todo_bloc/todo_bloc.dart';

// ignore: must_be_immutable
class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});
  static const routeName = "/add todo";
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();

  TextEditingController c3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Todo"),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      controller: c1,
                      decoration: const InputDecoration(
                          hintText: "Enter a Title", labelText: "Title")),
                  const SizedBox(height: 10),
                  TextField(
                      controller: c2,
                      decoration: const InputDecoration(
                          hintText: "Enter a Subtitle", labelText: "Subtitle")),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      Todo todo = Todo(title: c1.text, subtitle: c2.text);
                      final todoBloc = BlocProvider.of<TodoBloc>(context);
                      todoBloc.add(AddTodoEvent(todo: todo));
                      Navigator.pushNamedAndRemoveUntil(context,  HomeScreen.routeName, (route) => false);
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 3, 100, 91))),
                    child: const Text("Done"),
                  )
                ],
              ),
            ));
          },
        ));
  }
}
