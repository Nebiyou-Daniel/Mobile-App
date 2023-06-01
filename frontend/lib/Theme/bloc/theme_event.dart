
abstract class ThemeEvent {}

class ThemeChangedEvent extends ThemeEvent {
  final bool isDarkThemeOn;

  ThemeChangedEvent(this.isDarkThemeOn);
}
