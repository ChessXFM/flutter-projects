import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoproject/theme/data/themes.dart';

import '../../data/cache_helper.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetCurrentThemeEvent) {
        final themeIndex = await CacheHelper().getCachedTheme();
        final theme = AppThemes.values
            .firstWhere((element) => element.index == themeIndex);
        emit(LoadedThemeState(themeData: appThemeData[theme]));
      } else if (event is ThemeChangedEvent) {
        final themeIndex = event.theme.index;
        await CacheHelper().cacheTheme(themeIndex);
        emit(LoadedThemeState(themeData: appThemeData[event.theme]));
      }
    });
  }
}
