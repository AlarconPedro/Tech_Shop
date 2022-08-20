import 'package:flutter/material.dart';

enum IconesCategoria {
  computadores,
  notebooks,
  smartphones,
  tablets,
}

IconData iconCategorias(IconesCategoria icone) {
  switch (icone) {
    case IconesCategoria.computadores:
      return Icons.computer;
    case IconesCategoria.notebooks:
      return Icons.laptop;
    case IconesCategoria.smartphones:
      return Icons.smartphone;
    case IconesCategoria.tablets:
      return Icons.tablet;
    default:
      return Icons.computer;
  }
}
