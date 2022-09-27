import 'package:carousel_slider/carousel_slider.dart';
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
  int selected = 0;

  @override
  Widget build(BuildContext context) {
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
                      widget.produto.imagem1 != ""
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
                          : Container(),

                      //2nd Image of Slider
                      widget.produto.imagem2 != ""
                          ? Container(
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
                            )
                          : Container(),

                      //3rd Image of Slider
                      widget.produto.imagem3 != ""
                          ? Container(
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
                            )
                          : Container(),

                      //4th Image of Slider
                      widget.produto.imagem4 != ""
                          ? Container(
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
                            )
                          : Container(),

                      //5th Image of Slider
                      widget.produto.imagem5 != ""
                          ? Container(
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
                          : Container(),
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Qtd. Estoque: 10",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
              ),
            ),
          ),
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
