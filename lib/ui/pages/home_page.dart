import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.cinzaClaro,
      body: GridView.count(
        // Cria um grid com duas colunas
        crossAxisCount: 2,
        // Gera 100 Widgets que exibem o seu índice
        children: List.generate(10, (index) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color:
                  currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinza,
              boxShadow: [
                BoxShadow(
                  color: currentTheme.isDarkTheme()
                      ? Cores.verde
                      : Cores.pretoOpaco,
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
                    currentTheme.isDarkTheme() ? Cores.verde : Cores.pretoOpaco,
                width: 2,
              ),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    CupertinoIcons.hourglass,
                    size: 40,
                    color: Cores.branco,
                  ),
                ),
                Text(
                  'Item $index',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Cores.branco,
                  ),
                ),
              ],
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
