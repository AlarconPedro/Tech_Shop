import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class InputText extends StatefulWidget {
  const InputText({Key? key}) : super(key: key);

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
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
        hintStyle: TextStyle(
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.branco,
          decoration: TextDecoration.none,
        ),
        // fillColor: Colors.transparent,
      ),
    );
  }
}
