import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/globais.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/models/models.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/widgets/produto_descricao.dart';
import 'package:tech_shop/ui/widgets/widgets.dart';

class ProdutoPage extends StatefulWidget {
  final ProdutoModel produto;
  const ProdutoPage({Key? key, required this.produto}) : super(key: key);

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
      appBar: AppBar(
        title: const Text('Produto'),
        centerTitle: true,
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinzaClaro,
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ProdutoDescricao(produto: widget.produto),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Aproveite e veja também",
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.preto,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FutureBuilder(
                                  future: API().getRadomSugestion(
                                    widget.produto.categoriaId,
                                    widget.produto.id,
                                  ),
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
                                          return criarCardRandom(snapshot.data
                                              as List<ProdutoModel>);
                                        }
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
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
  }

  Widget criarCardRandom(List<ProdutoModel> produtoRandom) {
    return ProductRandomCard(produtos: produtoRandom);
  }
}
