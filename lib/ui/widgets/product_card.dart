import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/models/models.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class ProductCard extends StatefulWidget {
  double preco;
  int? precoDesconto;
  String nome;
  String descricao;
  String imagem1;
  String imagem2;
  String imagem3;
  String imagem4;
  String imagem5;
  ProdutoModel produto;

  ProductCard({
    Key? key,
    required this.preco,
    required this.precoDesconto,
    required this.nome,
    required this.descricao,
    required this.imagem1,
    required this.imagem2,
    required this.imagem3,
    required this.imagem4,
    required this.imagem5,
    required this.produto,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        GestureDetector(
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
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: currentTheme.isDarkTheme()
                    ? Cores.cinzaEscuro
                    : Cores.branco,
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 180,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Cores.branco,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Image.network(
                          Globais.urlImage + widget.produto.imagem1,
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
                            widget.produto.nome,
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.preto,
                              fontSize: 20,
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
                            horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            widget.produto.precoPromocional != 0
                                ? Text(
                                    "R\$ ${widget.produto.preco.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Cores.vermelho,
                                      fontWeight: FontWeight.bold,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2.5,
                                    ),
                                  )
                                : Container(),
                            widget.produto.precoPromocional != 0 &&
                                    widget.produto.precoPromocional != null
                                ? Text(
                                    "R\$ ${widget.produto.precoPromocional!.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Cores.verde,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    "R\$ ${widget.produto.preco.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Cores.verde,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 15),
                      //   child: Icon(Icons.favorite,
                      //       color: currentTheme.isDarkTheme()
                      //           ? Cores.branco
                      //           : Cores.pretoOpaco,
                      //       size: 30),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
