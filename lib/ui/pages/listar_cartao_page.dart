import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/datasource/local/querys/tb_pagamentoCartao_helper.dart';
import 'package:tech_shop/datasource/local/tb_pagamento_cartao.dart';
import 'package:tech_shop/ui/pages/cadastro_cartao_page.dart';

import '../../classes/classes.dart';
import '../../datasource/api/api.dart';
import '../../datasource/models/endereco_model.dart';
import '../estilos/estilos.dart';
import '../temas/temas.dart';
import '../widgets/widgets.dart';
import 'cadastro_pix_page.dart';

class ListarCartaoPage extends StatefulWidget {
  const ListarCartaoPage({Key? key}) : super(key: key);

  @override
  State<ListarCartaoPage> createState() => _ListarCartaoPageState();
}

class _ListarCartaoPageState extends State<ListarCartaoPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
        title: const Text('Cartões Cadastrados'),
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
                      child: FutureBuilder(
                        future: getCartoesCadastrados(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                            case ConnectionState.none:
                              return CirculoEspera.criar(cor: Cores.branco);
                            default:
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return listaCartao(
                                  snapshot.data as List<TbPagamentoCartao>,
                                );
                              }
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: FloatingActionButton(
                      backgroundColor: currentTheme.isDarkTheme()
                          ? Cores.vermelho
                          : Cores.azul,
                      onPressed: () async {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CadastroCartaoPage(),
                          ),
                          (route) => true,
                        );
                        setState(() {});
                      },
                      child: Icon(
                        Icons.add,
                        color: currentTheme.isDarkTheme()
                            ? Cores.branco
                            : Cores.branco,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<List<TbPagamentoCartao>> getCartoesCadastrados() async {
    var response = await TbPagamentoCartaoHelper().getCartoesPagamento();
    return response;
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
}
