import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/temas/theme_provider.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Tema(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Tema extends StatefulWidget {
  const Tema({Key? key}) : super(key: key);

  @override
  State<Tema> createState() => _TemaState();
}

class _TemaState extends State<Tema> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.setTheme =
        await themeChangeProvider.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: themeChangeProvider,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tech Shop',
        home: HomePage(),
      ),
    );
  }
}
