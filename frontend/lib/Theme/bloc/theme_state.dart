import 'package:equatable/equatable.dart';
import '../app_themes.dart';


class ThemeState extends Equatable {
  final AppTheme theme;

  const ThemeState({required this.theme});

  @override
  List<Object> get props => [theme];
}
