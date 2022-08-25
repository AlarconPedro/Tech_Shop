import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/models/models.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/produto_page.dart';
import 'package:tech_shop/ui/temas/theme_provider.dart';

class ProductRandomCard extends StatefulWidget {
  List<ProdutoModel> produtos;

  ProductRandomCard({
    Key? key,
    required this.produtos,
  }) : super(key: key);

  @override
  State<ProductRandomCard> createState() => _ProductRandomCardState();
}

class _ProductRandomCardState extends State<ProductRandomCard> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.produtos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProdutoPage(
                    produto: widget.produtos[index],
                  ),
                ),
              );
            },
            child: Column(
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
                        color: currentTheme.isDarkTheme()
                            ? Cores.verde
                            : Cores.azul,
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
                                Globais.urlImage +
                                    widget.produtos[index].imagem1,
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
                                    widget.produtos[index].nome,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "R\$ ${widget.produtos[index].preco},00",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Cores.vermelho,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 1.5,
                                    ),
                                  ),
                                  Text(
                                    "R\$ ${widget.produtos[index].precoPromocional},00",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
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
            ),
          );
        },
      ),
    );
  }
}
