import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/widgets/carrinho_card.dart';

import '../../classes/globais.dart';
import '../../datasource/models/models.dart';
import '../widgets/widgets.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({
    Key? key,
  }) : super(key: key);

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
                    Globais.qtdCarrinho > 0
                        ? Expanded(
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
                                      return Text(
                                        'Error: ${snapshot.error}',
                                      );
                                    } else {
                                      return itemCarrinho(
                                        snapshot.data as List<ProdutoModel>,
                                      );
                                    }
                                }
                              },

                              // Adicionar Itens do Carrinho
                            ),
                          )
                        : Expanded(
                            child: Center(
                              child: Text(
                                'Carrinho Vazio',
                                style: TextStyle(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.pretoOpaco,
                                  fontSize: 20,
                                ),
                              ),
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
                            "R\$ ${Globais.valorTotalCarrinho.toStringAsFixed(2)}",
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

  Widget itemCarrinho(List<ProdutoModel> produtoModel) {
    return ListView.builder(
      itemCount: produtoModel.length,
      itemBuilder: ((context, index) {
        return carrinhoCardo(
          produtoModel[index],
          produtoModel[index].quantidade,
        );
      }),
    );
  }

  Widget carrinhoCardo(ProdutoModel produtoModel, int? quantidade) {
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
        child: Expanded(
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
                                        quantidade != 0
                                            ? quantidade = quantidade! - 1
                                            : quantidade = 1;
                                        Globais.valorTotalCarrinho -=
                                            produtoModel.preco.toDouble();
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
                                        quantidade != 0
                                            ? quantidade = quantidade! + 1
                                            : quantidade = 1;
                                        Future.delayed(Duration.zero, () {
                                          Globais.valorTotalCarrinho +=
                                              produtoModel.preco.toDouble();
                                        });
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
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
                              setState(
                                () {
                                  API().removerDoCarrinho();
                                  // carrinho.remove(produto[0]);
                                },
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Cores.vermelho,
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
      ),
    );
  }

  Widget botaoFinalizarCompra() {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 10,
        right: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
              blurRadius: 3,
              spreadRadius: 1,
              blurStyle: BlurStyle.normal,
              // offset: const Offset(1.5, 1.5),
            ),
          ],
          shape: BoxShape.rectangle,
          color: currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    'Finalizar Compra',
                    style: TextStyle(
                      color: currentTheme.isDarkTheme()
                          ? Cores.branco
                          : Cores.pretoOpaco,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  "R\$ ${Globais.valorTotalCarrinho.toStringAsFixed(2)}",
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
      ),
    );
  }
}
