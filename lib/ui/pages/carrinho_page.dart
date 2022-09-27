import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({Key? key}) : super(key: key);

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
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
                          Expanded(
                            child: Container(),
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
                                  itemCarrinho(
                                    nome: 'Teste',
                                    quantidade: 1,
                                    preco: 10,
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
                            'R\$ 0,00',
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

  Widget itemCarrinho(
      {required String nome, required int quantidade, required double preco}) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 5, right: 2),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.46,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Cores.cinzaClaro,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                width: 2,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 5, right: 2),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.22,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Cores.cinzaClaro,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                width: 2,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 5, right: 2),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.20,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Cores.cinzaClaro,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
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
  }
}
