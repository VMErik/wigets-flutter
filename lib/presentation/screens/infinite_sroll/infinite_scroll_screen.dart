import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.add(lastId + 1);
    imagesIds.add(lastId + 2);
    imagesIds.add(lastId + 3);
    imagesIds.add(lastId + 4);
    imagesIds.add(lastId + 5);
  }

  void moveScrollBottom(){
    if(scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );

  }


  @override
  void initState() {
    // Añadimos un listener
    scrollController.addListener(() {
      // Si estamos mas o menos a unos 500 pixeles del final
      // scrollController.position.pixels : contiene en donde me encuentro
      // scrollController.position.maxScrollExtent :  contiene el tamaño total
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    // TODO: implement dispose
    super.dispose();
  }

  Future loadNextPage() async {
    // Si ya esta cargando, ya no lo hacemos
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    // Verificar si existe el componente
    if (!isMounted) return false;
    setState(() {});

    // Mover el scroll
    moveScrollBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds:3));
    if(!isMounted) return ;
    isLoading = false;
    
    final lastId = imagesIds.last;
    imagesIds.clear(); // Borramos
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll'),
      // ),
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity, // Para que sea el total de la pantalla
                  height: 300,
                  placeholder: AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: isLoading
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh),
              )
            : FadeIn(child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
