import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/local/querys/tb_pagamentoCartao_helper.dart';
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
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
        title: const Text('Finalizar Compra'),
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
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else {
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
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else {
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
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Finalizar'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: currentTheme.isDarkTheme()
                                ? Cores.branco
                                : Cores.cinzaEscuro,
                            backgroundColor: currentTheme.isDarkTheme()
                                ? Cores.vermelho
                                : Cores.branco,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // side: BorderSide(
                            //   color:
                            //       currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                            //   width: 1,
                            // ),
                          ),
                        ),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProdutoPage(
                produto: produtoModel,
              );
            },
          ),
        );
      },
      child: Padding(
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Excluir Cartão'),
                          content: const Text(
                              'Deseja realmente excluir este cartão?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Não'),
                            ),
                            TextButton(
                              onPressed: () {
                                TbPagamentoCartaoHelper().deletePagamentoCartao(
                                  cartao[index].numero,
                                );
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: const Text('Sim'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete, color: Cores.vermelho),
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Excluir Endereço'),
                          content: const Text(
                              'Deseja realmente excluir este endereço?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Não'),
                            ),
                            TextButton(
                              onPressed: () {
                                API().deleteEndereco(
                                    Globais.idCliente.toString());
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: const Text('Sim'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete, color: Cores.vermelho),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
