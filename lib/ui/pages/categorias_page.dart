import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/listar_categorias_page.dart';
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
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinzaClaro,
        title: Text(
          'Categorias',
          style: TextStyle(
              color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 1),
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListarCategoria(),
                            ));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: currentTheme.isDarkTheme()
                              ? Cores.cinzaEscuro
                              : Cores.branco,
                          boxShadow: [
                            BoxShadow(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.verde
                                  : Cores.azul,
                              blurRadius: 3,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.normal,
                              // offset: const Offset(1.5, 1.5),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            color: currentTheme.isDarkTheme()
                                ? Cores.verde
                                : Cores.azul,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Categoria $index',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.pretoOpaco,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
