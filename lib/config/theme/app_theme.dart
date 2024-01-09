import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 41, 101, 190);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.teal,
  Colors.yellow,
  Colors.purple
];

class AppTheme {

  final int selectedColor;

  AppTheme({
   this.selectedColor = 0 
  }): assert (selectedColor >= 0 && selectedColor <= _colorThemes.length-1, 'Colors must be between 0 and ${_colorThemes.length-1}');

  //  va a retornar un dato tipo themedata
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark
    );
  }

}