import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class ListarCategoria extends StatefulWidget {
  const ListarCategoria({Key? key}) : super(key: key);

  @override
  State<ListarCategoria> createState() => _ListarCategoriaState();
}

class _ListarCategoriaState extends State<ListarCategoria> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
      appBar: AppBar(
        title: const Text('Categorias'),
        centerTitle: true,
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinzaClaro,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6.5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProdutoPage(),
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
                      color:
                          currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
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
                    color:
                        currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 110,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Icon(
                            Icons.home,
                            color: currentTheme.isDarkTheme()
                                ? Cores.branco
                                : Cores.preto,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Text(
                                "R\$ ${index * 100},00",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Cores.verde,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "R\$ ${index * 100},00",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Cores.vermelho,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.favorite,
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.pretoOpaco,
                              size: 30),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
