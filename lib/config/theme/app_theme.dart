import 'package:flutter/material.dart';


const colorList = <Color>[
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.pink,
  Colors.purple,
  Colors.orange
];


class AppTheme{
  final int selectedColor;
  final bool isDarkMode ;

  AppTheme({
    this.selectedColor =  0 , this.isDarkMode = false
  }) : assert(selectedColor >= 0 , 'Selected color must be greater then 0') , 
      assert(selectedColor < colorList.length , 'Selected color must be less or equal than ${colorList.length - 1}');


ThemeData getTheme()=> ThemeData(
  useMaterial3: true,
  brightness: isDarkMode ?  Brightness.dark  :  Brightness.light,
  colorSchemeSeed: colorList[selectedColor] , 
  appBarTheme:  const AppBarTheme(
    centerTitle: false
  )
);


// Hacemos una copia de nuetro app Theme
// Se utiliza para copiar clases
AppTheme copyWith(
  {
    int? selectedColor ,
    bool? isDarkMode 
    }
) => AppTheme(
  // Como nuestros parametros son opcionales, evaluamos si lo estan enviado
  selectedColor: selectedColor ?? this.selectedColor, 
  isDarkMode: isDarkMode ?? this.isDarkMode
);

}