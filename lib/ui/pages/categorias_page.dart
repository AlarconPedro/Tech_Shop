import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class CategoriaPage extends StatefulWidget {
  const CategoriaPage({Key? key}) : super(key: key);

  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaClaro : Cores.cinzaClaro,
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinza,
        title: Text(
          'Categorias',
          style: TextStyle(color: Cores.branco),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 1,
        padding: EdgeInsets.all(10),
        children: List.generate(10, (index) {
          return ListTile(
            tileColor: currentTheme.isDarkTheme() ? Cores.branco : Cores.cinza,
            title: Text(
              'Categoria $index',
              style: TextStyle(
                color: currentTheme.isDarkTheme()
                    ? Cores.pretoOpaco
                    : Cores.branco,
              ),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProdutosPage(),
              //   ),
              // );
            },
          );
        }),
      ),
    );
  }
}
