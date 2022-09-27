import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/cores.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';

import '../../classes/classes.dart';

class FormaPagamento extends StatefulWidget {
  const FormaPagamento({Key? key}) : super(key: key);

  @override
  State<FormaPagamento> createState() => _FormaPagamentoState();
}

class _FormaPagamentoState extends State<FormaPagamento> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forma de Pagamento'),
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinzaClaro,
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
                                        'Pix',
                                        style: TextStyle(
                                          color: currentTheme.isDarkTheme()
                                              ? Cores.branco
                                              : Cores.preto,
                                          fontSize: 20,
                                        ),
                                      ),
                                      leading: Icon(
                                        Icons.pix_rounded,
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
                                          'Cartão de Crédito',
                                          style: TextStyle(
                                            color: currentTheme.isDarkTheme()
                                                ? Cores.branco
                                                : Cores.preto,
                                            fontSize: 20,
                                          ),
                                        ),
                                        leading: Icon(
                                          Icons.credit_card_rounded,
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
                                          'Boleto',
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
