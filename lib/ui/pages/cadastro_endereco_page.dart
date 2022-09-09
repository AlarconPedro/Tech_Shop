import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class CadastroEnderecoPage extends StatefulWidget {
  const CadastroEnderecoPage({Key? key}) : super(key: key);

  @override
  State<CadastroEnderecoPage> createState() => _CadastroEnderecoPageState();
}

class _CadastroEnderecoPageState extends State<CadastroEnderecoPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
        title: const Text('Cadastro de Endereço'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
            child: Column(
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
                                : Cores.azul,
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
                          color: currentTheme.isDarkTheme()
                              ? Cores.verde
                              : Cores.azul,
                          width: 1,
                        ),
                      ),
                      child: Column(children: [Container()]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: FloatingActionButton(
                      backgroundColor: currentTheme.isDarkTheme()
                          ? Cores.vermelho
                          : Cores.azul,
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: currentTheme.isDarkTheme()
                            ? Cores.branco
                            : Cores.branco,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
