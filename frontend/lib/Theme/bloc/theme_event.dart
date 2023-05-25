<<<<<<< HEAD
import '../app_themes.dart';
=======
>>>>>>> Nathnael-Dereje
import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeChangedEvent extends ThemeEvent {
<<<<<<< HEAD
  final AppTheme theme;

  ThemeChangedEvent(this.theme);

  @override
  List<Object> get props => [theme];
=======
  final bool isDarkThemeOn;

  ThemeChangedEvent(this.isDarkThemeOn);

  @override
  List<Object> get props => [isDarkThemeOn];
>>>>>>> Nathnael-Dereje
}


