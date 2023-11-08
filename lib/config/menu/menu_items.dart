// Crearemos todos los items del menu

import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones', 
    subtitle: 'Varios botones en flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ) , 
  MenuItem(
    title: 'Tarjetas', 
    subtitle: 'Un contenedor estiliado', 
    link: '/cards', 
    icon: Icons.credit_card
  ) ,
  MenuItem(
    title: 'Progress Indicators', 
    subtitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ) ,
  MenuItem(
    title: 'Snack Bars y dialogos', 
    subtitle: 'Indicadores en pantalla', 
    link: '/snackbars', 
    icon: Icons.info_outline
  ) ,
  MenuItem(
    title: 'Animated Container', 
    subtitle: 'Stateful  widget animado', 
    link: '/animated', 
    icon: Icons.check_box_outlined
  ) ,
  MenuItem(
    title: 'UI Controls', 
    subtitle: 'Serie de contrles de flutter', 
    link: '/ui-controls', 
    icon: Icons.card_giftcard_outlined
  ) ,
];