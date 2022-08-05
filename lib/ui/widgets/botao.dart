import 'package:flutter/material.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/home_page.dart';

class Botao {
  static Widget botaoLogin() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Cores.azul,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size.fromWidth(100),
      ),
      child: Text('Entrar'),
      onPressed: () {},
    );
  }
}
