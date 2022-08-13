import 'package:flutter/material.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';

class TabBarItens {
  static Tab criar(IconData icon, String text, {Color? color}) {
    return Tab(
      icon: Icon(
        icon,
        color: color ?? Cores.branco,
      ),
      text: text,
      iconMargin: const EdgeInsets.all(2),
    );
  }
}
