import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({Key? key}) : super(key: key);

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.cinzaClaro,
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinza,
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: currentTheme.isDarkTheme()
                      ? Cores.cinzaEscuro
                      : Cores.cinza,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
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
