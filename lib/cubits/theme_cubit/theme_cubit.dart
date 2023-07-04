import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial(
    
  ));

  void changeTheme() {
    emit(
      state.copyWith(
        themeData: state.isDark ? ThemeData.light() : ThemeData.dark(),
        isDark: !state.isDark,
      ),
    );
  }
}
