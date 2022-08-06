import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/temas/temas.dart';

import '../estilos/estilos.dart';

class LoginText extends StatefulWidget {
  const LoginText({Key? key}) : super(key: key);

  @override
  State<LoginText> createState() => _LoginTextState();
}

class _LoginTextState extends State<LoginText> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      // style: const TextStyle(
      //   backgroundColor: Colors.transparent,
      // ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.branco,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.branco,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.branco,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.vermelho : Cores.vermelho,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: 'Digite seu Login:',
        hintStyle: TextStyle(
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.cinzaEscuro,
        ),
      ),
    );
  }
}

class SenhaText extends StatefulWidget {
  const SenhaText({Key? key}) : super(key: key);

  @override
  State<SenhaText> createState() => _SenhaTextState();
}

class _SenhaTextState extends State<SenhaText> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      // style: const TextStyle(
      //   backgroundColor: Colors.transparent,
      // ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.branco,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.branco,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.branco,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.vermelho : Cores.vermelho,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: 'Digite sua Senha:',
        hintStyle: TextStyle(
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.cinzaEscuro,
        ),
      ),
    );
  }
}
