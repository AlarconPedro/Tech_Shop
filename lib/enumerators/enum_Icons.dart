import 'package:flutter/material.dart';

enum IconesCategoria {
  computadores,
  notebooks,
  smartphones,
  tablets,
}

IconData iconCategorias(int icone) {
  switch (icone) {
    case 0:
      return Icons.desktop_mac_outlined;
    case 1:
      return Icons.laptop;
    case 2:
      return Icons.smartphone;
    case 3:
      return Icons.tablet;
    default:
      return Icons.computer;
  }
}
