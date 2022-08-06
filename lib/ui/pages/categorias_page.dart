import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class CategoriaPage extends StatefulWidget {
  const CategoriaPage({Key? key}) : super(key: key);

  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.cinzaClaro,
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinza,
        title: Text(
          'Categorias',
          style: TextStyle(color: Cores.branco),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 5),
        children: List.generate(10, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: currentTheme.isDarkTheme()
                    ? Cores.cinzaEscuro
                    : Cores.cinza,
                boxShadow: [
                  BoxShadow(
                    color: currentTheme.isDarkTheme()
                        ? Cores.verde
                        : Cores.pretoOpaco,
                    blurRadius: 3,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.inner,
                    // offset: const Offset(1.5, 1.5),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(
                  color: currentTheme.isDarkTheme()
                      ? Cores.verde
                      : Cores.pretoOpaco,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Categoria $index',
                  style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Cores.branco
                        : Cores.pretoOpaco,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
