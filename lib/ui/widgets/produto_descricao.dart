import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/models/models.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/theme_provider.dart';

class ProdutoDescricao extends StatefulWidget {
  final ProdutoModel produto;

  const ProdutoDescricao({
    Key? key,
    required this.produto,
  }) : super(key: key);

  @override
  State<ProdutoDescricao> createState() => _ProdutoDescricaoState();
}

class _ProdutoDescricaoState extends State<ProdutoDescricao> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
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
        horizontal: 8,
        vertical: 8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Cores.branco,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: 450,
              height: 250,
              child: Image.network(
                Globais.urlImage + widget.produto.imagem1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Cores.vermelho,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Comprar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        "R\$ ${widget.produto.preco},00",
                        style: TextStyle(
                          fontSize: 18,
                          color: Cores.vermelho,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2.5,
                        ),
                      ),
                      Text(
                        "R\$ ${widget.produto.precoPromocional},00",
                        style: TextStyle(
                          fontSize: 25,
                          color: Cores.verde,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.favorite,
                      color: currentTheme.isDarkTheme()
                          ? Cores.branco
                          : Cores.pretoOpaco,
                      size: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    widget.produto.nome,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: currentTheme.isDarkTheme()
                          ? Cores.branco
                          : Cores.preto,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.produto.descricao,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
