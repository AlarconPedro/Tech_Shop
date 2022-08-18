import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class ProdutoPage extends StatefulWidget {
  const ProdutoPage({Key? key}) : super(key: key);

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
            child: Container(
              child: ListView(
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
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            width: 450,
                            height: 200,
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
                                      "R\$ 100,00",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Cores.verde,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "R\$ 100,00",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Cores.vermelho,
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
                        // Expanded(
                        // child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Descrição do produto',
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
                            "Mussum Ipsum, cacilds vidis litro abertis. Paisis, filhis, espiritis santis.Admodum accumsan disputationi eu sit. Vide electram sadipscing et per.Praesent vel viverra nisi. Mauris aliquet nunc non turpis scelerisque, eget.Copo furadis é disculpa de bebadis, arcu quam euismod magna.",
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 150,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: currentTheme.isDarkTheme()
                                                ? Cores.cinzaEscuro
                                                : Cores.branco,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    currentTheme.isDarkTheme()
                                                        ? Cores.verde
                                                        : Cores.azul,
                                                blurRadius: 3,
                                                spreadRadius: 1,
                                                blurStyle: BlurStyle.normal,
                                                // offset: const Offset(1.5, 1.5),
                                              ),
                                            ],
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: 110,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.amber,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.home,
                                                      color: currentTheme
                                                              .isDarkTheme()
                                                          ? Cores.branco
                                                          : Cores.preto,
                                                      size: 40,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "R\$ 100,00",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Cores.verde,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "R\$ 100,00",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Cores.vermelho,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Icon(Icons.favorite,
                                                        color: Cores.branco,
                                                        size: 30),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 150,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: currentTheme.isDarkTheme()
                                                ? Cores.cinzaEscuro
                                                : Cores.branco,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    currentTheme.isDarkTheme()
                                                        ? Cores.verde
                                                        : Cores.azul,
                                                blurRadius: 3,
                                                spreadRadius: 1,
                                                blurStyle: BlurStyle.normal,
                                                // offset: const Offset(1.5, 1.5),
                                              ),
                                            ],
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: 110,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.amber,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.home,
                                                      color: currentTheme
                                                              .isDarkTheme()
                                                          ? Cores.branco
                                                          : Cores.preto,
                                                      size: 40,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "R\$ 100,00",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Cores.verde,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "R\$ 100,00",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Cores.vermelho,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Icon(Icons.favorite,
                                                        color: Cores.branco,
                                                        size: 30),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 150,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: currentTheme.isDarkTheme()
                                                ? Cores.cinzaEscuro
                                                : Cores.branco,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    currentTheme.isDarkTheme()
                                                        ? Cores.verde
                                                        : Cores.azul,
                                                blurRadius: 3,
                                                spreadRadius: 1,
                                                blurStyle: BlurStyle.normal,
                                                // offset: const Offset(1.5, 1.5),
                                              ),
                                            ],
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: 110,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.amber,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.home,
                                                      color: currentTheme
                                                              .isDarkTheme()
                                                          ? Cores.branco
                                                          : Cores.preto,
                                                      size: 40,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "R\$ 100,00",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Cores.verde,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "R\$ 100,00",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Cores.vermelho,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Icon(Icons.favorite,
                                                        color: Cores.branco,
                                                        size: 30),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 150,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: currentTheme.isDarkTheme()
                                                ? Cores.cinzaEscuro
                                                : Cores.branco,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    currentTheme.isDarkTheme()
                                                        ? Cores.verde
                                                        : Cores.azul,
                                                blurRadius: 3,
                                                spreadRadius: 1,
                                                blurStyle: BlurStyle.normal,
                                                // offset: const Offset(1.5, 1.5),
                                              ),
                                            ],
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: 110,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.amber,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.home,
                                                      color: currentTheme
                                                              .isDarkTheme()
                                                          ? Cores.branco
                                                          : Cores.preto,
                                                      size: 40,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "R\$ 100,00",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Cores.verde,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "R\$ 100,00",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Cores.vermelho,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Icon(Icons.favorite,
                                                        color: Cores.branco,
                                                        size: 30),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
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
}
