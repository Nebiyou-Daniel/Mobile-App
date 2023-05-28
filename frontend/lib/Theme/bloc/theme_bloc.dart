import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/theme/bloc/theme_event.dart';
import 'package:frontend/theme/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightTheme()) {
    on<ThemeChangedEvent>((event, emit) {
      if (event.isDarkThemeOn) {
        emit(DarkTheme());
      } else {
        emit(LightTheme());
      }
    });
  }
}
