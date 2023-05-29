import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeChangedEvent extends ThemeEvent {
  final bool isDarkThemeOn;

  ThemeChangedEvent(this.isDarkThemeOn);

  @override
  List<Object> get props => [isDarkThemeOn];
}
