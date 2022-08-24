import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/globais.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/models/models.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';
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
                  Container(
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
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8, top: 8, right: 8),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.preto,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.45,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                // children: List.generate(5, (index) {
                                //   return const ProductCard();
                                // }),
                              ),
                            ],
                          ),
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
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: produtoRandom.length,
        itemBuilder: (context, index) {
          return Column(
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
                      color:
                          currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
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
                              Globais.urlImage + produtoRandom[index].imagem1,
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
                                  produtoRandom[index].nome,
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  "R\$ ${produtoRandom[index].preco},00",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Cores.vermelho,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 1.5,
                                  ),
                                ),
                                Text(
                                  "R\$ ${produtoRandom[index].precoPromocional},00",
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
                            padding: const EdgeInsets.symmetric(horizontal: 5),
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
          );
        },
      ),
    );
  }
}
