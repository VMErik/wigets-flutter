import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context , ref) {

    final bool darkModeValue = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title : const Text('Cambiar Tema'),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(isDarkModeProvider.notifier).update((state) => state = !darkModeValue);
            }, 
            icon: Icon( darkModeValue ? Icons.light_mode_outlined :Icons.dark_mode_outlined)
          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context , ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColorIndex = ref.watch(selectedColorProvider);


    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index){
        final color = colors[index];
        return RadioListTile(
          title:  Text('Este color' , style :  TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: selectedColorIndex, 
          onChanged: (value){
            // Notificar el ccambio
            ref.read(selectedColorProvider.notifier)
                .update((state)=>state = index);
          }
        );
      },
    );
  }
}