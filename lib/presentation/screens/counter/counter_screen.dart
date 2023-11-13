import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'ccounter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // Estaremos pendiente de nuestro counter provider
    // Cada que cambie, flutter escuchara el nuevo valor
    final int counterValue = ref.watch(counterProvider);
    final bool darkModeValue = ref.watch(isDarkModeProvider);

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter') , 
        actions: [
          IconButton(
            onPressed: (){
              // Escuchamos nuestro provider y lo actualizamos
              ref.read(isDarkModeProvider.notifier)
                .update((state) => !state);
            }, 
            icon: Icon( darkModeValue ? Icons.light_mode_outlined :Icons.dark_mode_outlined)
          )
        ],
      ),
      body : Center(
          child: Text(
            'Valor : $counterValue' , 
            style: Theme.of(context).textTheme.titleLarge
            ),
        ), 
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Cabiaremmos nuestro provider
          // Notificamos el cambio a traves del state
          ref.read(counterProvider.notifier)
            .update((state) => state +1) ;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}