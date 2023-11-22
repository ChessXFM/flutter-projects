

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoproject/data/cache_helper.dart';
import 'package:todoproject/screens/Splash%20Screen/splash_screen.dart';
import 'package:todoproject/screens/add_todo/add_todo.dart';
import 'package:todoproject/screens/home/home.dart';
import 'package:todoproject/screens/settings/settings.dart';
import 'package:todoproject/theme/bloc/theme_bloc.dart';
import 'package:todoproject/todo/todo_bloc/todo_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
        ),
        BlocProvider<TodoBloc>(
          create: (context) =>
              TodoBloc(cacheHelper: CacheHelper())..add(GetAllTodosEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  HomeScreen.routeName: (context) => const HomeScreen(),
                  SettingsPage.routeName: (context) => const SettingsPage(),
                  AddTodoPage.routeName: (context) => AddTodoPage(),
                  MySplashScreen.routeName: (context) => const MySplashScreen(),
                },
                theme: state.themeData,
                home: const HomeScreen());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
