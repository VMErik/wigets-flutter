import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  static const name  = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 59;
  double height =50;
  Color color = Colors.indigo;
  double borderRadius = 20;

  void changeShape(){
    final random = Random();

    width = random.nextInt(300)  + 50;
    height = random.nextInt(300)  + 50;
    borderRadius = random.nextInt(100) + 20;

    color = Color.fromRGBO(
      random.nextInt(255),// red
      random.nextInt(255),// green
      random.nextInt(255), //blue
      1 //opacity
    );

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      body: Center(
        // Nos va a ayudar para la animacion, tenemos que especificar el tiempo de duracion
        child: AnimatedContainer(
          duration:  const Duration(milliseconds: 400),
          curve: Curves.easeInExpo, // Tipo de animacion que queremos que tenga
          width: width <= 0 ? 0 :width,
          height: height <= 0 ? 0 :height,
          decoration:  BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius <= 0  ? 0 : borderRadius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:  changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}