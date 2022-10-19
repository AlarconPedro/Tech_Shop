import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/models/models.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
      body: FutureBuilder(
        future: API().getProdutosRandom(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return CirculoEspera.criar(cor: Cores.branco);
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return criarCard(snapshot.data as List<ProdutoModel>);
              }
          }
        },
      ),
    );
  }

  Widget criarCard(List<ProdutoModel> produtoRandom) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: produtoRandom.length,
        itemBuilder: (context, index) {
          return ProductCard(
            preco: produtoRandom[index].preco,
            precoDesconto: produtoRandom[index].precoPromocional,
            nome: produtoRandom[index].nome,
            descricao: produtoRandom[index].descricao,
            imagem1: produtoRandom[index].imagem1,
            imagem2: produtoRandom[index].imagem2,
            imagem3: produtoRandom[index].imagem3,
            imagem4: produtoRandom[index].imagem4,
            imagem5: produtoRandom[index].imagem5,
            produto: produtoRandom[index],
          );
        },
      ),
    );
  }
}
