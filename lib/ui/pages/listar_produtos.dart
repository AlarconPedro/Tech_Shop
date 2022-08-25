import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/models/models.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/widgets/circulo_espera.dart';
import 'package:tech_shop/ui/widgets/widgets.dart';

class ListarProdutos extends StatefulWidget {
  final CategoriaModel? model;
  const ListarProdutos({Key? key, required this.model}) : super(key: key);

  @override
  State<ListarProdutos> createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
      appBar: AppBar(
        title: Text(widget.model!.nome),
        centerTitle: true,
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.cinzaClaro,
      ),
      body: FutureBuilder(
        future: API().getProdutos(widget.model!.id),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return CirculoEspera.criar(cor: Cores.branco);
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return cardProduto(snapshot.data as List<ProdutoModel>);
              }
          }
        },
      ),
    );
  }

  Widget cardProduto(List<ProdutoModel> produtos) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        return ProductCard(
          preco: produtos[index].preco,
          precoDesconto: produtos[index].precoPromocional,
          nome: produtos[index].nome,
          descricao: produtos[index].descricao,
          imagem1: produtos[index].imagem1,
          imagem2: produtos[index].imagem2,
          imagem3: produtos[index].imagem3,
          imagem4: produtos[index].imagem4,
          imagem5: produtos[index].imagem5,
          produto: produtos[index],
        );
      },
    );
  }
}
