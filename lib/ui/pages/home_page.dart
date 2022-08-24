import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/models/models.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
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
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
      body: GridView.count(
        // Cria um grid com duas colunas
        crossAxisCount: 2,
        // Gera 100 Widgets que exibem o seu índice
        children: [
          FutureBuilder(
            future: API().getProdutosRandom(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return CirculoEspera.criar(cor: Cores.branco);
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return criarCard(snapshot.data as List<ProdutoModel>);
                  }
              }
            },
          ),
        ],
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

  Widget criarCard(List<ProdutoModel> produtoRandom) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: produtoRandom.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: 180,
                  height: 230,
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
                      color:
                          currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
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
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Cores.branco,
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Image.network(
                              Globais.urlImage + produtoRandom[index].imagem1,
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
                              child: Container(
                                width: 160,
                                child: Text(
                                  produtoRandom[index].nome,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: currentTheme.isDarkTheme()
                                          ? Cores.branco
                                          : Cores.preto,
                                      fontSize: 15),
                                ),
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
                                  "R\$ ${produtoRandom[index].preco},00",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Cores.vermelho,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 1.5,
                                  ),
                                ),
                                Text(
                                  "R\$ ${produtoRandom[index].precoPromocional},00",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Cores.verde,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(Icons.favorite,
                                color: Cores.branco, size: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
