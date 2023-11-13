import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    // Utilizamos riverpod, ProviderScope esta dentro 
    const ProviderScope(
      child : MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context , ref) {

    final int selectedColorIndex = ref.watch(selectedColorProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return  MaterialApp.router(
      // Aputntamos a nuestras rutas
      title: 'Flutter Widgets', // Este es el titulo de la aplicacion
      routerConfig:  appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectedColorIndex , isDarkMode: isDarkMode).getTheme(),
      
    );
  }
}
