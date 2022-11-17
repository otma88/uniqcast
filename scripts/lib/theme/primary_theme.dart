part of 'themes.dart';

final _theme = ThemeData();
//TODO: Modify this to your needs
final primaryTheme = ThemeData(
  primarySwatch: Colors.cyan,
  colorScheme: _theme.colorScheme.copyWith(secondary: Colors.cyan),
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.grey,
);
