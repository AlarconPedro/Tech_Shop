import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.pretoOpaco : Cores.branco,
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.azul,
        title: Text(
          'Tech Shop',
          style: TextStyle(
            color: Cores.branco,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Cores.branco,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Cores.branco,
            onPressed: () {},
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Switch(
        value: currentTheme.isDarkTheme(),
        onChanged: (value) {
          setState(() {
            String theme = value ? ThemePreference.Dark : ThemePreference.Light;
            currentTheme.setTheme = theme;
          });
        },
      ),
    );
  }
}
