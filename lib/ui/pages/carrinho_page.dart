import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

import '../../classes/globais.dart';
import '../../datasource/models/models.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({Key? key}) : super(key: key);

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  int quantidade = 1;
  double preco = 0;
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
          'Carrinho',
          style: TextStyle(
              color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
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
                  shape: BoxShape.rectangle,
                  color: currentTheme.isDarkTheme()
                      ? Cores.cinzaEscuro
                      : Cores.branco,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    color:
                        currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    // Text(
                    //   'Produtos',
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //     color: Cores.branco,
                    //   ),
                    // ),
                    // Divider(
                    //   color: Cores.verde,
                    //   thickness: 2,
                    // ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Produto',
                              style: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.pretoOpaco,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: currentTheme.isDarkTheme()
                                ? Cores.verde
                                : Cores.azul,
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Qtde.',
                              style: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.pretoOpaco,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: currentTheme.isDarkTheme()
                                ? Cores.verde
                                : Cores.azul,
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              right: 20,
                              left: 5,
                            ),
                            child: Text(
                              'Preço',
                              style: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.pretoOpaco,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color:
                          currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                      thickness: 2,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  FutureBuilder(
                                    future: Future.delayed(
                                      const Duration(seconds: 2),
                                    ),
                                    builder: (context, snapshot) {
                                      return itemCarrinho(
                                        'Teste',
                                        10,
                                        Globais.carrinho,
                                      );
                                    },
                                  ),
                                ],
                                // Adicionar Itens do Carrinho
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color:
                          currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.pretoOpaco,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            'R\$ ${preco * quantidade},00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.pretoOpaco,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 75,
          ),
        ],
      ),
    );
  }

  // Widget itemCarrinho({
  //   required String nome,
  //   required int quantidade,
  //   required double preco,
  //   required List<ProdutoModel> produto,
  // }) {
  //   final currentTheme = Provider.of<ThemeProvider>(context);

  //   return Globais.carrinho.isNotEmpty
  //       ? Padding(
  //           padding: const EdgeInsets.all(3),
  //           child: Container(
  //             decoration: BoxDecoration(
  //               color: currentTheme.isDarkTheme()
  //                   ? Cores.branco
  //                   : Cores.cinzaClaro,
  //               borderRadius: BorderRadius.circular(8.0),
  //             ),
  //             child: Column(
  //               children: [
  //                 // Row(
  //                 //   children: [
  //                 //     Padding(
  //                 //       padding: const EdgeInsets.only(
  //                 //         left: 5,
  //                 //         bottom: 5,
  //                 //         right: 2,
  //                 //         top: 5,
  //                 //       ),
  //                 //       child: Container(
  //                 //         width: MediaQuery.of(context).size.width * 0.46,
  //                 //         height: 50,
  //                 //         decoration: BoxDecoration(
  //                 //           shape: BoxShape.rectangle,
  //                 //           color: Cores.branco,
  //                 //           borderRadius: const BorderRadius.all(
  //                 //             Radius.circular(8),
  //                 //           ),
  //                 //           border: Border.all(
  //                 //             color: currentTheme.isDarkTheme()
  //                 //                 ? Cores.verde
  //                 //                 : Cores.azul,
  //                 //             width: 2,
  //                 //           ),
  //                 //         ),
  // child: Padding(
  //   padding: const EdgeInsets.all(1),
  //   child: Row(
  //     children: [
  //       Expanded(
  //         child: Container(
  //           margin: const EdgeInsets.all(1.0),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(8.0),
  //             image: DecorationImage(
  //               image: NetworkImage(
  //                 Globais.urlImage + produto[0].imagem1,
  //               ),
  //               fit: BoxFit.contain,
  //             ),
  //           ),
  //         ),
  //       ),
  //       // Padding(
  //                 //               //   padding: const EdgeInsets.only(left: 5),
  //                 //               //   child: Text(
  //                 //               //     produto[0].nome,
  //                 //               //     overflow: TextOverflow.ellipsis,
  //                 //               //     style: TextStyle(
  //                 //               //       color: currentTheme.isDarkTheme()
  //                 //               //           ? Cores.pretoClaro
  //                 //               //           : Cores.pretoOpaco,
  //                 //               //       fontSize: 12,
  //                 //               //       fontWeight: FontWeight.bold,
  //                 //               //     ),
  //                 //               //   ),
  //                 //               // ),
  //                 //             ],
  //                 //           ),
  //                 //         ),
  //                 //       ),
  //                 //     ),
  //                 //     Padding(
  //                 //       padding: const EdgeInsets.only(
  //                 //         left: 2,
  //                 //         bottom: 5,
  //                 //         right: 2,
  //                 //         top: 5,
  //                 //       ),
  //                 //       child: Container(
  //                 //         width: MediaQuery.of(context).size.width * 0.22,
  //                 //         height: 50,
  //                 //         decoration: BoxDecoration(
  //                 //           shape: BoxShape.rectangle,
  //                 //           color: Cores.branco,
  //                 //           borderRadius: const BorderRadius.all(
  //                 //             Radius.circular(8),
  //                 //           ),
  //                 //           border: Border.all(
  //                 //             color: currentTheme.isDarkTheme()
  //                 //                 ? Cores.verde
  //                 //                 : Cores.azul,
  //                 //             width: 2,
  //                 //           ),
  //                 //         ),
  //                 //         child: Center(
  //                 //           child: Text(
  //                 //             '$quantidade',
  //                 //             style: TextStyle(
  //                 //               color: currentTheme.isDarkTheme()
  //                 //                   ? Cores.pretoClaro
  //                 //                   : Cores.pretoOpaco,
  //                 //               fontSize: 20,
  //                 //               fontWeight: FontWeight.bold,
  //                 //             ),
  //                 //           ),
  //                 //         ),
  //                 //       ),
  //                 //     ),
  //                 //     Padding(
  //                 //       padding: const EdgeInsets.only(
  //                 //         left: 2,
  //                 //         bottom: 5,
  //                 //         right: 2,
  //                 //         top: 5,
  //                 //       ),
  //                 //       child: Container(
  //                 //         width: MediaQuery.of(context).size.width * 0.20,
  //                 //         height: 50,
  //                 //         decoration: BoxDecoration(
  //                 //           shape: BoxShape.rectangle,
  //                 //           color: Cores.branco,
  //                 //           borderRadius: const BorderRadius.all(
  //                 //             Radius.circular(8),
  //                 //           ),
  //                 //           border: Border.all(
  //                 //             color: currentTheme.isDarkTheme()
  //                 //                 ? Cores.verde
  //                 //                 : Cores.azul,
  //                 //             width: 2,
  //                 //           ),
  //                 //         ),
  //                 //         child: Center(
  //                 //           child: Text(
  //                 //             'R\$ ${produto[0].preco}',
  //                 //             style: TextStyle(
  //                 //               color: currentTheme.isDarkTheme()
  //                 //                   ? Cores.pretoClaro
  //                 //                   : Cores.pretoOpaco,
  //                 //               fontSize: 16,
  //                 //               fontWeight: FontWeight.bold,
  //                 //             ),
  //                 //           ),
  //                 //         ),
  //                 //       ),
  //                 //     ),
  //                 //   ],
  //                 // ),
  //                 // Divider(
  //                 //   color:
  //                 //       currentTheme.isDarkTheme() ? Cores.preto : Cores.preto,
  //                 //   thickness: 2,
  //                 // ),
  //                 // Expanded(
  //                 //   child: Row(
  //                 //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 //     children: [
  //                 //       Text(
  //                 //         produto[0].descricao,
  //                 //         style: TextStyle(
  //                 //           color: currentTheme.isDarkTheme()
  //                 //               ? Cores.pretoClaro
  //                 //               : Cores.pretoOpaco,
  //                 //           fontSize: 16,
  //                 //           fontWeight: FontWeight.bold,
  //                 //         ),
  //                 //       ),
  //                 //       IconButton(
  //                 //         onPressed: () {},
  //                 //         icon: Icon(
  //                 //           Icons.delete_rounded,
  //                 //           color: Cores.vermelho,
  //                 //         ),
  //                 //       )
  //                 //     ],
  //                 //   ),
  //                 // )
  //               ],
  //             ),
  //           ),
  //         )
  //       : Center(
  //           child: Text(
  //             "Sem Itens no Carrinho !",
  //             style: TextStyle(
  //               fontSize: 20,
  //               fontWeight: FontWeight.bold,
  //               color: Cores.branco,
  //             ),
  //           ),
  //         );

  // return Padding(
  //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //   child: Container(
  //     decoration: BoxDecoration(
  //       boxShadow: [
  //         BoxShadow(
  //           color: currentTheme.isDarkTheme()
  //               ? Cores.cinzaEscuro.withOpacity(0.5)
  //               : Cores.branco.withOpacity(0.5),
  //           spreadRadius: 5,
  //           blurRadius: 7,
  //           offset: const Offset(0, 3), // changes position of shadow
  //         ),
  //       ],
  //     ),
  //     width: MediaQuery.of(context).size.width,
  //     height: MediaQuery.of(context).size.height * 0.1,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Text(
  //           nome,
  //           style: TextStyle(
  //             color: Cores.pretoOpaco,
  //             fontSize: 20,
  //           ),
  //         ),
  //         Expanded(
  //           child: Container(),
  //         ),
  //         Text(
  //           quantidade.toString(),
  //           style: TextStyle(
  //             color: Cores.pretoOpaco,
  //             fontSize: 20,
  //           ),
  //         ),
  //         Expanded(
  //           child: Container(),
  //         ),
  //         Text(
  //           'R\$ $preco',
  //           style: TextStyle(
  //             color: Cores.pretoOpaco,
  //             fontSize: 20,
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
  // }

  Widget itemCarrinho(
      String nome, double precoProduto, List<ProdutoModel> produto) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    preco = precoProduto;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Expanded(
        child: Container(
          width: 332,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Cores.branco,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(
              color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //     Globais.urlImage + produto[0].imagem1,
                      //   ),
                      //   fit: BoxFit.contain,
                      // ),
                    ),
                    child: Icon(
                      Icons.image,
                      color: Cores.pretoOpaco,
                      size: 100,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          width: 110,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Cores.branco,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.verde
                                  : Cores.azul,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantidade--;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: Cores.vermelho,
                                ),
                              ),
                              Center(
                                child: Text(
                                  quantidade.toString(),
                                  style: TextStyle(
                                    color: currentTheme.isDarkTheme()
                                        ? Cores.pretoClaro
                                        : Cores.pretoOpaco,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantidade++;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Cores.verde,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Cores.branco,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                            color: currentTheme.isDarkTheme()
                                ? Cores.verde
                                : Cores.azul,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'R\$ ${produto[0].preco * quantidade},00',
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.pretoClaro
                                  : Cores.pretoOpaco,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Divider(
                  color: Cores.pretoOpaco,
                  thickness: 1,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.18,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Cores.branco,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                          color: currentTheme.isDarkTheme()
                              ? Cores.verde
                              : Cores.azul,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListView(
                            children: [
                              Text(
                                produto[0].nome,
                                style: TextStyle(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.pretoClaro
                                      : Cores.pretoOpaco,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Cores.branco,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      border: Border.all(
                        color: currentTheme.isDarkTheme()
                            ? Cores.verde
                            : Cores.azul,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            // carrinho.remove(produto[0]);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Cores.vermelho,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
