import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/globais.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/models/endereco_model.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/cadastro_endereco_page.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/widgets/widgets.dart';

class ListarEnderecosPage extends StatefulWidget {
  const ListarEnderecosPage({Key? key}) : super(key: key);

  @override
  State<ListarEnderecosPage> createState() => _ListarEnderecosPageState();
}

class _ListarEnderecosPageState extends State<ListarEnderecosPage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
        title: const Text('Endereços Cadastrados'),
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
                      child: FutureBuilder(
                        future: API().getEnderecos(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                            case ConnectionState.none:
                              return CirculoEspera.criar(cor: Cores.branco);
                            default:
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return listEndereco(
                                  snapshot.data as List<EnderecoModel>,
                                );
                              }
                          }
                        },
                      ),
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
                      onPressed: () async {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CadastroEnderecoPage(),
                          ),
                          (route) => true,
                        );
                        setState(() {});
                      },
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

  Widget listEndereco(List<EnderecoModel> endereco) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return ListView.builder(
      itemCount: endereco.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              Globais.enderecoSelected = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Container(
              decoration: Globais.enderecoSelected == index
                  ? BoxDecoration(
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
                    )
                  : const BoxDecoration(),
              child: ListTile(
                leading: Checkbox(
                  checkColor: Cores.preto,
                  activeColor: Cores.branco,
                  value: Globais.enderecoSelected == index,
                  onChanged: (value) {
                    setState(() {
                      Globais.enderecoSelected = index;
                    });
                  },
                ),
                title: Text(
                  "${endereco[index].endereco} - ${endereco[index].numero}",
                  style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Cores.branco
                        : Cores.pretoOpaco,
                  ),
                ),
                subtitle: Text(
                  endereco[index].bairro,
                  style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Cores.branco
                        : Cores.pretoOpaco,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Excluir Endereço'),
                          content: const Text(
                              'Deseja realmente excluir este endereço?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Não'),
                            ),
                            TextButton(
                              onPressed: () {
                                API().deleteEndereco(
                                    Globais.idCliente.toString());
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: const Text('Sim'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete, color: Cores.vermelho),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
