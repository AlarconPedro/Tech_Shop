import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/local/querys/tb_pagamentoCartao_helper.dart';
import 'package:tech_shop/datasource/local/querys/tb_usuario_helper.dart';
import 'package:tech_shop/ui/pages/pages.dart';

import '../../classes/classes.dart';
import '../../datasource/local/tb_pagamento_cartao.dart';
import '../../datasource/models/endereco_model.dart';
import '../../datasource/models/models.dart';
import '../estilos/estilos.dart';
import '../temas/temas.dart';
import '../widgets/widgets.dart';

class FinalizarCompraPage extends StatefulWidget {
  const FinalizarCompraPage({Key? key}) : super(key: key);

  @override
  State<FinalizarCompraPage> createState() => _FinalizarCompraPageState();
}

class _FinalizarCompraPageState extends State<FinalizarCompraPage> {
  @override
  Widget build(BuildContext context) {
    Globais.finalizaVenda = true;
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor:
            currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
        title: Text(
          'Finalizar Compra',
          style: TextStyle(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
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
                        shape: BoxShape.rectangle,
                        color: currentTheme.isDarkTheme()
                            ? Cores.cinzaEscuro
                            : Cores.branco,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: currentTheme.isDarkTheme()
                              ? Cores.verde
                              : Cores.azul,
                          width: 1,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Endereço de Entrega',
                                    style: TextStyle(
                                      color: currentTheme.isDarkTheme()
                                          ? Cores.branco
                                          : Cores.cinzaEscuro,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  height: 80,
                                  width: double.infinity,
                                  child: FutureBuilder(
                                    future: API().getEnderecos(),
                                    builder: (context, snapshot) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.waiting:
                                        case ConnectionState.none:
                                          return CirculoEspera.criar(
                                              cor: Cores.branco);
                                        default:
                                          if (snapshot.hasError) {
                                            Globais.finalizaVenda = false;
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else {
                                            Globais.finalizaVenda = true;
                                            return listEndereco(
                                              snapshot.data
                                                  as List<EnderecoModel>,
                                            );
                                          }
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Divider(
                                    color: currentTheme.isDarkTheme()
                                        ? Cores.verde
                                        : Cores.azul,
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Forma de Pagamento',
                                    style: TextStyle(
                                      color: currentTheme.isDarkTheme()
                                          ? Cores.branco
                                          : Cores.cinzaEscuro,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  width: double.infinity,
                                  child: FutureBuilder(
                                    future: TbPagamentoCartaoHelper()
                                        .getCartoesPagamento(),
                                    builder: (context, snapshot) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.waiting:
                                        case ConnectionState.none:
                                          return CirculoEspera.criar(
                                              cor: Cores.branco);
                                        default:
                                          if (snapshot.hasError) {
                                            Globais.finalizaVenda = false;
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else {
                                            Globais.finalizaVenda = true;
                                            return listaCartao(
                                              snapshot.data
                                                  as List<TbPagamentoCartao>,
                                            );
                                          }
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Divider(
                                    color: currentTheme.isDarkTheme()
                                        ? Cores.verde
                                        : Cores.azul,
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Itens no Carrinho',
                                    style: TextStyle(
                                      color: currentTheme.isDarkTheme()
                                          ? Cores.branco
                                          : Cores.cinzaEscuro,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: FutureBuilder(
                                    future: API().getItensCarrinho(),
                                    builder: (context, snapshot) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.waiting:
                                        case ConnectionState.none:
                                          return CirculoEspera.criar(
                                            cor: Cores.branco,
                                          );
                                        default:
                                          if (snapshot.hasError) {
                                            Globais.finalizaVenda = false;
                                            return Expanded(
                                              child: Center(
                                                child: Text(
                                                  'Carrinho Vazio',
                                                  style: TextStyle(
                                                    color: currentTheme
                                                            .isDarkTheme()
                                                        ? Cores.branco
                                                        : Cores.pretoOpaco,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            Globais.finalizaVenda = true;
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color:
                                                      currentTheme.isDarkTheme()
                                                          ? Cores.cinzaEscuro
                                                          : Cores.branco,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: currentTheme
                                                              .isDarkTheme()
                                                          ? Cores.verde
                                                          : Cores.azul,
                                                      blurRadius: 3,
                                                      spreadRadius: 1,
                                                      blurStyle:
                                                          BlurStyle.normal,
                                                      // offset: const Offset(1.5, 1.5),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  border: Border.all(
                                                    color: currentTheme
                                                            .isDarkTheme()
                                                        ? Cores.verde
                                                        : Cores.azul,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: itemCarrinho(
                                                  snapshot.data
                                                      as List<ProdutoModel>,
                                                ),
                                              ),
                                            );
                                          }
                                      }
                                    },

                                    // Adicionar Itens do Carrinho
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total: ',
                                        style: TextStyle(
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.cinzaEscuro,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'R\$ ${Globais.valorTotalCarrinho.trimRight().replaceAll('0.', ',')}',
                                        style: TextStyle(
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.preto,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Globais.finalizaVenda
                            ? ElevatedButton(
                                onPressed: () async {
                                  API().finalizarCarrinho();
                                  TbUsuarioHelper().updateIdVenda(0);
                                  Globais.vendaId = 0;
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text('Finalizar'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.cinzaEscuro,
                                  backgroundColor: currentTheme.isDarkTheme()
                                      ? Cores.vermelho
                                      : Cores.azul,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // side: BorderSide(
                                  //   color:
                                  //       currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                                  //   width: 1,
                                  // ),
                                ),
                              )
                            : Container(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget itemCarrinho(List<ProdutoModel> produtoModel) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return ListView.builder(
      itemCount: produtoModel.length,
      itemBuilder: ((context, index) {
        // Globais.valorTotalCarrinho =
        //     produtoModel[index].preco * produtoModel[index].quantidade!;
        return Column(
          children: [
            carrinhoCard(
              produtoModel[index],
              produtoModel[index].quantidade,
              produtoModel[index].id,
              Globais.vendaId,
            ),
            // index == produtoModel.length - 1
            //     ? Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 10),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           children: [
            //             Text(
            //               'Total: R\$ ${Globais.valorTotalCarrinho.trimRight().replaceAll('0.', ',')}',
            //               style: TextStyle(
            //                 color: currentTheme.isDarkTheme()
            //                     ? Cores.branco
            //                     : Cores.preto,
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ],
            //         ),
            //       )
            //     : Container(),
          ],
        );
      }),
    );
  }

  Widget carrinhoCard(
      ProdutoModel produtoModel, int? quantidade, int produtoId, int vendaId) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
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
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.network(
                        Globais.urlImage + produtoModel.imagem1,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Qtda: ${quantidade.toString()}",
                        style: TextStyle(
                          color: currentTheme.isDarkTheme()
                              ? Cores.pretoClaro
                              : Cores.pretoOpaco,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
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
                        child: Center(
                          child: Text(
                            'R\$ ${produtoModel.preco}0',
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Divider(
                color: Cores.pretoOpaco,
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Cores.branco,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ListView(
                          children: [
                            Text(
                              produtoModel.descricao,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: currentTheme.isDarkTheme()
                                    ? Cores.pretoClaro
                                    : Cores.pretoOpaco,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listaCartao(List<TbPagamentoCartao> cartao) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return ListView.builder(
      itemCount: cartao.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              Globais.enderecoSelected = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Container(
              decoration: Globais.enderecoSelected == index
                  ? BoxDecoration(
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
                    )
                  : const BoxDecoration(),
              child: ListTile(
                leading: Checkbox(
                  checkColor: Cores.preto,
                  activeColor: Cores.branco,
                  value: Globais.enderecoSelected == index,
                  onChanged: (value) {
                    setState(() {
                      Globais.enderecoSelected = index;
                    });
                  },
                ),
                title: Text(
                  cartao[index].nomeTitular,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Cores.branco
                        : Cores.pretoOpaco,
                  ),
                ),
                subtitle: Text(
                  "${cartao[index].numero.substring(0, 4)} **** **** ${cartao[index].numero.substring(16, 16)}",
                  style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Cores.branco
                        : Cores.pretoOpaco,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.credit_card_rounded, color: Cores.branco),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget listEndereco(List<EnderecoModel> endereco) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return ListView.builder(
      itemCount: endereco.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              Globais.enderecoSelected = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Container(
              decoration: Globais.enderecoSelected == index
                  ? BoxDecoration(
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
                    )
                  : const BoxDecoration(),
              child: ListTile(
                leading: Checkbox(
                  checkColor: Cores.preto,
                  activeColor: Cores.branco,
                  value: Globais.enderecoSelected == index,
                  onChanged: (value) {
                    setState(() {
                      Globais.enderecoSelected = index;
                    });
                  },
                ),
                title: Text(
                  "${endereco[index].endereco} - ${endereco[index].numero}",
                  style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Cores.branco
                        : Cores.pretoOpaco,
                  ),
                ),
                subtitle: Text(
                  endereco[index].bairro,
                  style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Cores.branco
                        : Cores.pretoOpaco,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.location_on, color: Cores.branco),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
