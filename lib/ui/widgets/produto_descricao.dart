import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/local/querys/tb_usuario_helper.dart';
import 'package:tech_shop/datasource/models/models.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
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
  var descricao = "";
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    descricao = widget.produto.descricao;
    descricao = descricao.replaceAll("#PressStart", "");
    var valorNormal = widget.produto.preco.toString();
    valorNormal = valorNormal.replaceAll('.0', ',00');
    var valorDesconto = widget.produto.precoPromocional.toString();
    valorDesconto = valorDesconto.replaceAll('.0', ',00');
    final currentTheme = Provider.of<ThemeProvider>(context);
    final carroselController = CarouselController();
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
              height: 260,
              child: ListView(
                children: [
                  CarouselSlider(
                    items: [
                      //1st Image of Slider
                      widget.produto.imagem1 == ""
                          ? Container(
                              color: Cores.branco,
                            )
                          : Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    Globais.urlImage + widget.produto.imagem1,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                      //2nd Image of Slider
                      widget.produto.imagem2 == ""
                          ? Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    Globais.urlImage + widget.produto.imagem1,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    Globais.urlImage + widget.produto.imagem2,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                      //3rd Image of Slider
                      widget.produto.imagem3 == ""
                          ? Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    Globais.urlImage + widget.produto.imagem1,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    Globais.urlImage + widget.produto.imagem3,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                      //4th Image of Slider
                      widget.produto.imagem4 == ""
                          ? Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    Globais.urlImage + widget.produto.imagem1,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    Globais.urlImage + widget.produto.imagem4,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                      //5th Image of Slider
                      widget.produto.imagem5 == ""
                          ? Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    Globais.urlImage + widget.produto.imagem1,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    Globais.urlImage + widget.produto.imagem5,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                    ],
                    carouselController: carroselController,
                    //Slider Container properties
                    options: CarouselOptions(
                      height: 255.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            height: 75,
            child: ListView.builder(
              itemCount: widget.produto.imageToJson().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                      carroselController.animateToPage(selected);
                      cardImage(index);
                    });
                  },
                  child: cardImage(index),
                );
              },
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
                    onPressed: () {
                      Globais.vendaId < 1
                          ? API().criarCarrinho(
                              Globais.idCliente,
                              widget.produto,
                            )
                          : API().adicionarAoCarrinho(
                              produtoId: widget.produto.id,
                              quantidade: Globais.qtdCarrinho,
                              valor: widget.produto.preco.toString(),
                              vendaId: Globais.vendaId,
                            );

                      setState(() {
                        Globais.qtdCarrinho++;
                        // Globais.valorTotalCarrinho += widget.produto.preco;
                      });
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CarrinhoPage(),
                          ),
                        );
                      });
                    },
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
                      widget.produto.precoPromocional != 0
                          ? Text(
                              "R\$ $valorNormal",
                              style: TextStyle(
                                fontSize: 18,
                                color: Cores.vermelho,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.5,
                              ),
                            )
                          : Container(),
                      widget.produto.precoPromocional != 0 &&
                              widget.produto.precoPromocional != null
                          ? Text(
                              "R\$ $valorDesconto,00",
                              style: TextStyle(
                                fontSize: 25,
                                color: Cores.verde,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              "R\$ $valorNormal",
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
                //   padding: const EdgeInsets.symmetric(horizontal: 10),
                //   child: Icon(
                //     Icons.favorite,
                //     color: currentTheme.isDarkTheme()
                //         ? Cores.branco
                //         : Cores.pretoOpaco,
                //     size: 30,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Qtd. Estoque: ${widget.produto.estoque}",
                    style: TextStyle(
                      fontSize: 18,
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
              descricao,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: Text(
          //     "Qtd. Estoque: ${widget.produto.estoque}",
          //     style: TextStyle(
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold,
          //       color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget cardImage(int index) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Cores.branco,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        width: 70,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            Globais.urlImage + widget.produto.imageToJson()[index],
          ),
        ),
      ),
    );
  }
}
