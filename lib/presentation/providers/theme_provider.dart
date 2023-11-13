import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider =  StateProvider((ref) => false);

// Provider inmutable 
// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple entero
final selectedColorProvider = StateProvider((ref) =>0);



// Un objeto de AppTheme (Objeto personalizado)
// Primero el nombre de la clase que controle el estado
// El valor  va como segundo parametro  
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
  );

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme>{

  // State  = Estado = new AppTheme
  ThemeNotifier() :  super(AppTheme());

  void toggleDarkMode(){
    // Le mandamos una copia pero con el color opuesto
    state = state.copyWith(isDarkMode: !state.isDarkMode );
  }

  void changeColorIndex(int index){
    state = state.copyWith(selectedColor : index);
  }

}