import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/datasource/api/api.dart';

import '../../classes/classes.dart';
import '../../datasource/models/models.dart';
import '../estilos/estilos.dart';
import '../pages/pages.dart';
import '../temas/temas.dart';

class CarrinhoCard extends StatefulWidget {
  final ProdutoModel produto;
  int? quantidade;

  CarrinhoCard({
    Key? key,
    required this.produto,
    required this.quantidade,
  }) : super(key: key);

  @override
  State<CarrinhoCard> createState() => _CarrinhoCardState();
}

class _CarrinhoCardState extends State<CarrinhoCard> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProdutoPage(
                produto: widget.produto,
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
                            Globais.urlImage + widget.produto.imagem1,
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
                                      API().retirarDoCarrinho(
                                        widget.produto.id,
                                        Globais.vendaId,
                                      );
                                      setState(() {
                                        widget.quantidade != 0
                                            ? widget.quantidade =
                                                widget.quantidade! - 1
                                            : widget.quantidade = 1;
                                        // Globais.valorTotalCarrinho -=
                                        //     widget.produto.preco.toDouble();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Cores.vermelho,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      widget.quantidade.toString(),
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
                                      API().adicionarAoCarrinho(
                                        produtoId: widget.produto.id,
                                        vendaId: Globais.vendaId,
                                      );
                                      setState(() {
                                        widget.quantidade != 0
                                            ? widget.quantidade =
                                                widget.quantidade! + 1
                                            : widget.quantidade = 1;
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
                                'R\$ ${widget.produto.preco.toInt()},00',
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
                                  widget.produto.descricao,
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
                                  API().removerDoCarrinho(
                                    widget.produto.id,
                                    Globais.idCliente,
                                  );
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
}
