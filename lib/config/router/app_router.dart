import 'package:go_router/go_router.dart';
// Apuntamos a donde estan todas nuestras screens exportadas
import 'package:widgets_app/presentation/screens.dart';
import 'package:widgets_app/presentation/screens/counter/counter_screen.dart';


final appRouter = GoRouter(
  // Definimos nuesta ruta principal
  initialLocation: '/',
  routes: [
    GoRoute(
      name :CounterScreen.name , 
      path: '/counter',
      builder: (context, state) => const CounterScreen(),
    ),
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
     GoRoute(
      name :ProgressScreen.name , 
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
    ),
     GoRoute(
      name :SnackBarScreen.name , 
      path: '/snackbars',
      builder: (context, state) => const SnackBarScreen(),
    ),
    GoRoute(
      name :AnimatedScreen.name , 
      path: '/animated',
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      name :UiControlsScreen.name , 
      path: '/ui-controls',
      builder: (context, state) => const UiControlsScreen(),
    ),
    GoRoute(
      name :AppTutorialScreen.name , 
      path: '/tutorial',
      builder: (context, state) => const AppTutorialScreen(),
    ),
    GoRoute(
      name :InfiniteScrollScreen.name , 
      path: '/infinite',
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      name :ThemeChangerScreen.name , 
      path: '/theme-changer',
      builder: (context, state) => const ThemeChangerScreen(),
    ),
  ],
);