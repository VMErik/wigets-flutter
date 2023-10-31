import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name  = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Buttons Screen')
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: (){
          // Salimos de la pantalla
          context.pop();
        } 
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SizedBox(
          // Es similar al flexbox , va acomodando a lado y cuando ya no cabe lo manda abajo
          child: Wrap(
            spacing: 10, // Establece un espacio entre controles
            alignment: WrapAlignment.center, // Centramos el contenido
            children: [
              ElevatedButton(onPressed: (){}, child: const Text('Elevated Button')),
              const ElevatedButton(onPressed: null, child: Text('Button Disabled')),
              ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.alarm_add_outlined), label:const Text('Elevated Icon')),
              FilledButton(onPressed: (){}, child: const Text('Filled')),
              FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.account_balance_rounded), label: const Text('Filled Icon')),
              OutlinedButton(onPressed: (){}, child: const Text('Outlined Button')),
              OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.ad_units_rounded), label: const Text('Outlined Icon') ),
              TextButton(onPressed: (){}, child:const Text('Text Button')),
              TextButton.icon(onPressed: (){}, icon: const Icon(Icons.add_chart_outlined), label:const Text('Text Icon')),
              IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded), 
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary), 
                iconColor:const  MaterialStatePropertyAll(Colors.white),
                ),
              ) ,
              CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}





// Boton personalizado
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; // Obtenemos nuestro esquema de colores
    return  ClipRRect( // Nos servira para redondear bordes
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child:   InkWell( // El InkWell es practicamente como un gesture detector
        onTap: (){},
          child: const  Padding(
            padding:  EdgeInsets.symmetric( horizontal: 20, vertical:10),
            child:  Text('Custom Button' , style: TextStyle(color: Colors.white),)
          ),
        ),
      ),
    );
  }
}