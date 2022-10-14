import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/datasource/api/api.dart';

import '../../datasource/models/models.dart';
import '../estilos/estilos.dart';
import '../temas/temas.dart';

class CarrinhoCard extends StatefulWidget {
  final ProdutoModel produto;

  const CarrinhoCard({Key? key, required this.produto}) : super(key: key);

  @override
  State<CarrinhoCard> createState() => _CarrinhoCardState();
}

class _CarrinhoCardState extends State<CarrinhoCard> {
  @override
  Widget build(BuildContext context) {
    int quantidade = 0;
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Expanded(
        child: Container(
          width: 332,
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
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //     Globais.urlImage + produto[0].imagem1,
                      //   ),
                      //   fit: BoxFit.contain,
                      // ),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.produto.imagem1,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    // child: SizedBox(
                    //   width: 100,
                    //   height: 100,
                    //   child: Image.network(widget.produto.imagem1),
                    // ),
                    // child: Icon(
                    //   Icons.image,
                    //   color: Cores.pretoOpaco,
                    //   size: 100,
                    // ),
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
                                    quantidade--;
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
                                    quantidade++;
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
                        width: 100,
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
                            'R\$ ${widget.produto.preco},00',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Divider(
                  color: Cores.pretoOpaco,
                  thickness: 1,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.18,
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
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListView(
                            children: [
                              Text(
                                widget.produto.descricao,
                                style: TextStyle(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.pretoClaro
                                      : Cores.pretoOpaco,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                          setState(() {
                            API().removerDoCarrinho();
                            // carrinho.remove(produto[0]);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Cores.vermelho,
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
}
