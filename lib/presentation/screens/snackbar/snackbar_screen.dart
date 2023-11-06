import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name  = 'snackbar_screen';
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars(); // Ocultamos todos los demas snackbars

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola Mundo'),
        action:  SnackBarAction(label: 'OK!', onPressed: (){}),
        duration: const Duration(seconds: 1)),
    );
  }

  
  void openDialog(BuildContext context){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
            title: const Text('Confirmacion'),
            content: const Text('Este es el contenido de nuestro dialogo ya un poco mas editado'),
            actions: [
               TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),
               FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar')),
            ],
          ),
        );
    }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: const Text('Snackbars y dialogos') , 
      ) ,

      body: Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center, 
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  children: [
                    const Text('Estas son las licencias que estamos ocupando lorem in')
                  ] , 
                  context: context
                ) ;
              }, 
              child: const Text('Licencias Usadas')
            ),
             FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              } ,
              child: const Text('Mostrar dialogo de pantalla')
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=> showCustomSnackbar(context) ,  
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}