import 'package:go_router/go_router.dart';
// Apuntamos a donde estan todas nuestras screens exportadas
import 'package:widgets_app/presentation/screens.dart';


final appRouter = GoRouter(
  // Definimos nuesta ruta principal
  initialLocation: '/',
  routes: [
      GoRoute(
      name : HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name : ButtonsScreen.name , 
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      name :CardsScreen.name , 
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);