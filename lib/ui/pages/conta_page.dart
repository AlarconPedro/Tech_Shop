import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/listar_enderecos_page.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';

import '../../classes/classes.dart';

class ContaPage extends StatefulWidget {
  const ContaPage({Key? key}) : super(key: key);

  @override
  State<ContaPage> createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinzaClaro,
        title: Text(
          'Conta',
          style: TextStyle(
              color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
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
                  shape: BoxShape.rectangle,
                  color: currentTheme.isDarkTheme()
                      ? Cores.cinzaEscuro
                      : Cores.branco,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    color:
                        currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
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
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.cinzaClaro,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Icon(Icons.person),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      Globais.nomeCliente,
                                      style: TextStyle(
                                        color: currentTheme.isDarkTheme()
                                            ? Cores.branco
                                            : Cores.preto,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      Globais.emailCliente,
                                      style: TextStyle(
                                        color: currentTheme.isDarkTheme()
                                            ? Cores.branco
                                            : Cores.preto,
                                        fontSize: 13,
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
                    Expanded(
                      child: Column(
                        children: [
                          Divider(
                            color: currentTheme.isDarkTheme()
                                ? Cores.verde
                                : Cores.azul,
                            thickness: 2,
                          ),
                          Expanded(
                            child: Container(
                              child: ListView(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: currentTheme.isDarkTheme()
                                          ? Cores.cinzaMedio
                                          : Cores.cinzaClaro,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      style: ListTileStyle.list,
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: currentTheme.isDarkTheme()
                                            ? Cores.branco
                                            : Cores.pretoOpaco,
                                      ),
                                      title: Text(
                                        'Endereços',
                                        style: TextStyle(
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.preto,
                                          fontSize: 20,
                                        ),
                                      ),
                                      leading: Icon(
                                        Icons.location_pin,
                                        size: 28,
                                        color: currentTheme.isDarkTheme()
                                            ? Cores.branco
                                            : Cores.preto,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ListarEnderecosPage(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        color: currentTheme.isDarkTheme()
                                            ? Cores.cinzaMedio
                                            : Cores.cinzaClaro,
                                      ),
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        style: ListTileStyle.list,
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.pretoOpaco,
                                        ),
                                        title: Text(
                                          'Favoritos',
                                          style: TextStyle(
                                            color: currentTheme.isDarkTheme()
                                                ? Cores.branco
                                                : Cores.preto,
                                            fontSize: 20,
                                          ),
                                        ),
                                        leading: Icon(
                                          Icons.favorite,
                                          size: 28,
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.preto,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        color: currentTheme.isDarkTheme()
                                            ? Cores.cinzaMedio
                                            : Cores.cinzaClaro,
                                      ),
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        style: ListTileStyle.list,
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.pretoOpaco,
                                        ),
                                        title: Text(
                                          'Forma de Pagamento',
                                          style: TextStyle(
                                            color: currentTheme.isDarkTheme()
                                                ? Cores.branco
                                                : Cores.preto,
                                            fontSize: 20,
                                          ),
                                        ),
                                        leading: Icon(
                                          Icons.monetization_on_rounded,
                                          size: 28,
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.preto,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const FormaPagamento(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        color: currentTheme.isDarkTheme()
                                            ? Cores.cinzaMedio
                                            : Cores.cinzaClaro,
                                      ),
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        style: ListTileStyle.list,
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.pretoOpaco,
                                        ),
                                        title: Text(
                                          'Carrinho',
                                          style: TextStyle(
                                            color: currentTheme.isDarkTheme()
                                                ? Cores.branco
                                                : Cores.preto,
                                            fontSize: 20,
                                          ),
                                        ),
                                        leading: Icon(
                                          Icons.shopping_cart_rounded,
                                          size: 28,
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.preto,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const CarrinhoPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 20,
                                    ),
                                    child: Divider(
                                      color: currentTheme.isDarkTheme()
                                          ? Cores.verde
                                          : Cores.azul,
                                      thickness: 2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        color: currentTheme.isDarkTheme()
                                            ? Cores.cinzaMedio
                                            : Cores.cinzaClaro,
                                      ),
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        style: ListTileStyle.list,
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.pretoOpaco,
                                        ),
                                        title: Text(
                                          'Contato',
                                          style: TextStyle(
                                            color: currentTheme.isDarkTheme()
                                                ? Cores.branco
                                                : Cores.preto,
                                            fontSize: 20,
                                          ),
                                        ),
                                        leading: Icon(
                                          Icons.headphones,
                                          size: 28,
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.preto,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: currentTheme.isDarkTheme()
                                ? Cores.verde
                                : Cores.azul,
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.exit_to_app,
                                        color: currentTheme.isDarkTheme()
                                            ? Cores.branco
                                            : Cores.pretoOpaco,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                const LoginPage()),
                                          ),
                                          (route) => false);
                                    },
                                  ),
                                  Text(
                                    "Sair",
                                    style: TextStyle(
                                      color: currentTheme.isDarkTheme()
                                          ? Cores.branco
                                          : Cores.pretoOpaco,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.sunny,
                                      color: currentTheme.isDarkTheme()
                                          ? Cores.branco
                                          : Cores.preto,
                                    ),
                                    Switch(
                                      activeColor: Cores.cinzaClaro,
                                      value: currentTheme.isDarkTheme(),
                                      onChanged: (value) {
                                        setState(() {
                                          String theme = value
                                              ? ThemePreference.Dark
                                              : ThemePreference.Light;
                                          currentTheme.setTheme = theme;
                                        });
                                      },
                                    ),
                                    Icon(
                                      Icons.nightlight_round,
                                      color: currentTheme.isDarkTheme()
                                          ? Cores.branco
                                          : Cores.preto,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 75,
          ),
        ],
      ),
    );
  }
}
