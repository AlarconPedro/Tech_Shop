import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

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
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.cinzaClaro,
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinza,
        title: const Text('Conta'),
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
                      color: currentTheme.isDarkTheme()
                          ? Cores.verde
                          : Cores.pretoOpaco,
                      blurRadius: 3,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.normal,
                      // offset: const Offset(1.5, 1.5),
                    ),
                  ],
                  shape: BoxShape.rectangle,
                  color: currentTheme.isDarkTheme()
                      ? Cores.cinzaEscuro
                      : Cores.cinza,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
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
                                      : Cores.pretoOpaco,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  blurStyle: BlurStyle.normal,
                                  // offset: const Offset(1.5, 1.5),
                                ),
                              ],
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.pretoOpaco,
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
                                      'Nome completo do usuário',
                                      style: TextStyle(
                                        color: Cores.branco,
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
                                : Cores.pretoOpaco,
                            thickness: 2,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(),
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
          SizedBox(
            height: 75,
          ),
        ],
      ),
    );
  }
}
