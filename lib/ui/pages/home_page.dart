import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
      body: GridView.count(
        // Cria um grid com duas colunas
        crossAxisCount: 2,
        // Gera 100 Widgets que exibem o seu índice
        children: List.generate(10, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProdutoPage();
              }));
            },
            child: Container(
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
                        child:
                            Icon(Icons.favorite, color: Cores.branco, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      // body: ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, index) {
      // return Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Container(
      //         width: 145,
      //         height: 145,
      //         color: Cores.branco,
      //       ),
      //       Container(
      //         width: 145,
      //         height: 145,
      //         color: Cores.branco,
      //       ),
      //     ],
      //   ),
      // );
      //   },
      //   // children: [
      //   //   Column(
      //   //     children: [
      //   //       Padding(
      //   //         padding: const EdgeInsets.all(8.0),
      //   //         child: Row(
      //   //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   //           children: [
      //   //             Container(
      //   //               width: 145,
      //   //               height: 145,
      //   //               color: Cores.branco,
      //   //             ),
      //   //             Container(
      //   //               width: 145,
      //   //               height: 145,
      //   //               color: Cores.branco,
      //   //             ),
      //   //           ],
      //   //         ),
      //   //       ),
      //   //       Padding(
      //   //         padding: const EdgeInsets.all(8.0),
      //   //         child: Row(
      //   //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   //           children: [
      //   //             Container(
      //   //               width: 135,
      //   //               height: 135,
      //   //               color: Cores.branco,
      //   //             ),
      //   //             Container(
      //   //               width: 135,
      //   //               height: 135,
      //   //               color: Cores.branco,
      //   //             ),
      //   //           ],
      //   //         ),
      //   //       ),
      //   //       Padding(
      //   //         padding: const EdgeInsets.all(8.0),
      //   //         child: Row(
      //   //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   //           children: [
      //   //             Container(
      //   //               width: 135,
      //   //               height: 135,
      //   //               color: Cores.branco,
      //   //             ),
      //   //             Container(
      //   //               width: 135,
      //   //               height: 135,
      //   //               color: Cores.branco,
      //   //             ),
      //   //           ],
      //   //         ),
      //   //       ),
      //   //     ],
      //   //   ),
      //   // ],
      // ),
    );
  }

  criarCard() {
    for (var i = 0; i < 10; i++) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 135,
              height: 135,
              color: Cores.branco,
            ),
            Container(
              width: 135,
              height: 135,
              color: Cores.branco,
            ),
          ],
        ),
      );
    }
  }
}
