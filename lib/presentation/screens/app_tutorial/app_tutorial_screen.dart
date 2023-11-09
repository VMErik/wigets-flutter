import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageURL;

  SlideInfo(
      {required this.title, required this.caption, required this.imageURL});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption: 'Busca en los diferentes restaurantes la comida que prefieras',
      imageURL: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega rapida',
      caption:
          'Seleccioona la entrega a traves de uno de nuestrs repartidores afiliados y recibe tu comida en cuestion de minutos',
      imageURL: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption:
          'Disfruta la comida que mas te gusta de una forma facil y economica',
      imageURL: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endTutorial = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewController.addListener(() {
      // Añadimos un listener que imprima el page en la que me encuentre paramostrar el boton
      final page = pageViewController.page ?? 0;
      if(!endTutorial && page >= (slides.length - 1.5)) {
        setState(() {
          endTutorial = true;
        });
      }
    });
  }  

  @override
  void dispose() {
    pageViewController.dispose();
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageURL))
                  .toList()),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () {
                  context.pop();
                },
              )) , 
          
          endTutorial ? Positioned(
            bottom: 20,
            right:20, 
            // Creamos una animacion
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds:1),
              child: FilledButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Comenzar'),
              ),
            )
          )
          : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Aliena de forma vertical
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alinea de forma horizontal
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(height: 10),
          Text(caption, style: captionStyle)
        ],
      )),
    );
  }
}
