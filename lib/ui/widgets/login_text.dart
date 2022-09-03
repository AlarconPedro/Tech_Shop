import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      style: TextStyle(
        color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
      ),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person_rounded,
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        ),
        labelText: 'Login',
        labelStyle: TextStyle(
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
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
          decoration: TextDecoration.none,
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
      style: TextStyle(
        color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
      ),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        ),
        suffixIcon: Icon(
          Icons.remove_red_eye,
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        ),
        labelText: 'Senha',
        labelStyle: TextStyle(
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
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
