import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color:
                  currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
              boxShadow: [
                BoxShadow(
                  color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
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
                color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                width: 1,
              ),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 6.5,
              vertical: 6,
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
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Flexible(
                        child: Text(
                          'Nome do produto',
                          style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.preto,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            "R\$ 100,00",
                            style: TextStyle(
                              fontSize: 18,
                              color: Cores.verde,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "R\$ 100,00",
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
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child:
                          Icon(Icons.favorite, color: Cores.branco, size: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
