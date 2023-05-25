import '../app_themes.dart';
import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeChangedEvent extends ThemeEvent {
  final AppTheme theme;

  ThemeChangedEvent(this.theme);

  @override
  List<Object> get props => [theme];
}


