
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Theme/theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightTheme()) {
    on<ThemeChangedEvent>((event, emit) {
      if (event.isDarkThemeOn) {
        // save the dart theme on to the shared preference


        emit(DarkTheme());
      } else {
        emit(LightTheme());
      }
    });
  }
}