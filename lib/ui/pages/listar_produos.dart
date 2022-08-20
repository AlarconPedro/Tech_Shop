import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/models/models.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/widgets/circulo_espera.dart';

class ListarProdutos extends StatefulWidget {
  const ListarProdutos({Key? key}) : super(key: key);

  @override
  State<ListarProdutos> createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinzaClaro,
      ),
      body: FutureBuilder(
        future: API().getProdutos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return CirculoEspera.criar(cor: Cores.branco);
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return cardProduto(snapshot.data as List<ProdutoModel>);
              }
          }
        },
      ),
    );
  }

  Widget cardProduto(List<ProdutoModel> produtos) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProdutoPage(
                produto: produtos[index],
              );
            }));
          },
          child: Container(
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
            child: Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 180,
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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            produtos[index].nome,
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.preto,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              "R\$ ${produtos[index].precoPromocional},00",
                              style: TextStyle(
                                fontSize: 25,
                                color: Cores.verde,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "R\$ ${produtos[index].preco},00",
                              style: TextStyle(
                                fontSize: 18,
                                color: Cores.vermelho,
                                fontWeight: FontWeight.bold,
                                decorationStyle: TextDecorationStyle.solid,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.5,
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
          ),
        );
      },
    );
  }

  // criarCard() {
  //   for (var i = 0; i < 10; i++) {
  //     return Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Container(
  //             width: 135,
  //             height: 135,
  //             color: Cores.branco,
  //           ),
  //           Container(
  //             width: 135,
  //             height: 135,
  //             color: Cores.branco,
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
}
