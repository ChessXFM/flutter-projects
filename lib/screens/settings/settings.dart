import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoproject/theme/bloc/theme_bloc.dart';
import 'package:todoproject/theme/data/themes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: AppThemes.values.length,
        itemBuilder: (context, index) {
          final item = AppThemes.values[index];
          return Card(
            color: appThemeData[item].primaryColor,
            child: ListTile(
              onTap: () {
                context.read<ThemeBloc>().add(ThemeChangedEvent(theme: item));
              },
              title: Text(item.name),
            ),
          );
        },
      ),
    );
  }
}
