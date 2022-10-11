import 'package:tech_shop/datasource/models/produto_model.dart';

class Globais {
  //Rotas da API
  static String urlPadrao = "http://187.87.223.235:8180";
  static String urlCategorias = "$urlPadrao/api/v1/categoria";
  static String urlProdutos = "$urlPadrao/api/v1/produto";
  static String urlProdutosRandom = "$urlPadrao/api/v1/produto";
  static String urlProdutoId = "$urlPadrao/api/v1/produto/";
  static String urlImage = "$urlPadrao/produtos/";
  static String urlLogin = "$urlPadrao/api/v1/loginCliente";
  static String urlRandon = "$urlPadrao/api/v1/produto/categoria/";
  static String urlProdutoCategoriaId = "$urlPadrao/api/v1/produto/categoria/";
  static String urlCadastroEndereco = "$urlPadrao/api/v1/endereco";
  static String urlCadastroCliente = "$urlPadrao/api/v1/cliente";
  static String urlEnderecoId = "$urlPadrao/api/v1/enderecoCliente/";
  static String urlDeleteEndereco = "$urlPadrao/api/v1/endereco/";
  static String urlItensCarrinho = "$urlPadrao/api/venda/carrinho/";

  //Valores Cliente
  static String nomeCliente = "";
  static String cpfCliente = "";
  static String emailCliente = "";
  static String senhaCliente = "";
  static String telefoneCliente = "";
  static String cepCliente = "";
  static String logradouroCliente = "";
  static String numeroCliente = "";
  static String complementoCliente = "";
  static String bairroCliente = "";
  static String cidadeCliente = "";
  static String estadoCliente = "";
  static String idCliente = "";
  static int enderecoSelected = 0;

  // Carrinho
  static List<ProdutoModel> carrinho = [];
  static int idCarrinho = 0;
}
