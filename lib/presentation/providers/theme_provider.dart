import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider =  StateProvider((ref) => false);

// Provider inmutable 
// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple entero
final selectedColorProvider = StateProvider((ref) =>0);