
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    // Obtenemos el padding de la parte superior
    final bool hasNotch = MediaQuery.of(context).viewPadding.top > 35; 
    
    // Con esto obtenemos la plataforma que ejecuta
    // Platform.isAndroid


    return  NavigationDrawer(
      selectedIndex:  navDrawerIndex,
      onDestinationSelected: (value){
        setState(() {
          navDrawerIndex = value.toInt();
        });
        final menuItem = appMenuItems[value];
        // context.go :  Mueve la ruta, no nos permite regresar
        context.push(menuItem.link);
        // Con widgets, hacemos refferencia a lo declarado en nuestro Stateful Widget
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children:  [
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 35,16,10),
          child: Text('Menu Principal')
        ),

        ...appMenuItems
        .sublist(0,3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label:  Text(item.title) , 
          )), 
        
        const Padding(
          padding:EdgeInsets.fromLTRB(28,16,28,10),
          child: Divider()
        ) , 
        
        const Padding(
          padding:EdgeInsets.fromLTRB(28,16,28,10),
          child: Text('Opciones Avanzadas')
        ) , 

        ...appMenuItems
        .sublist(3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label:  Text(item.title) , 
          )), 
        

      ],
    );
  }
}