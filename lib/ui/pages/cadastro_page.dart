import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/theme_provider.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinzaClaro,
        title: const Text(
          'Cadastro',
        ),
        centerTitle: true,
      ),
      body: Container(
        color: currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: currentTheme.isDarkTheme()
                    ? Cores.cinzaEscuro
                    : Cores.branco,
                borderRadius: BorderRadius.circular(10),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
