import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF3F0080);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
];

class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert (
    selectedColor >= 0 && selectedColor < _colorThemes.length -1,
    'El color se debe encontrar entre 0 y ${_colorThemes.length -1}'
  );

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark
    );
  }


}