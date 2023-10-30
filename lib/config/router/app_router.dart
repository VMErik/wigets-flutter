import 'package:go_router/go_router.dart';
// Apuntamos a donde estan todas nuestras screens exportadas
import 'package:widgets_app/presentation/screens.dart';


final appRouter = GoRouter(
  // Definimos nuesta ruta principal
  initialLocation: '/',
  routes: [
      GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);