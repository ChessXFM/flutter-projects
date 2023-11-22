import 'package:flutter/material.dart';
import 'package:todoproject/theme/data/themes.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        // backgroundColor: Colors.teal,
        color: MyTheme.appColor,
      )),
    );
  }
}
