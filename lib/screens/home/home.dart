import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoproject/screens/home/widgets/loading.dart';
import 'package:todoproject/screens/home/widgets/my_error_widget.dart';
import 'package:todoproject/screens/home/widgets/todo_widget.dart';
import 'package:todoproject/theme/data/themes.dart';
import '../../todo/todo_bloc/todo_bloc.dart';
import '../add_todo/add_todo.dart';
import '../settings/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AboutDialog(
          applicationIcon: Icon(Icons.android),
          applicationLegalese: "Debug Mode",
          applicationName: "Todo IT",
          applicationVersion: "1.0",
          children: []),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.appColor,
        child: const Icon(Icons.add),
        onPressed: () {
          //? TODO : show snackbar instead of navigating to another screen ..
          Navigator.pushNamed(context, AddTodoPage.routeName);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          activeIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
          backgroundColor: const Color.fromARGB(255, 2, 75, 67),
          tooltip: "Tasks",
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_rounded),
          ),
          backgroundColor: Colors.redAccent,
          tooltip: "Favorite Tasks",
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_rounded),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_outline_rounded),
          ),
          backgroundColor: Colors.green,
          tooltip: "Completed",
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_outline_rounded),
          ),
        ),
      ]),
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Todo App'),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
          )),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return TodoWidget(
              todos: state.todos,
            );
          } else if (state is ErrorState) {
            return MyErrorWidget(message: state.message);
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
