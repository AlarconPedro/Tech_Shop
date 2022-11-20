import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
  static String urlItensCarrinho = "$urlPadrao/api/carrinho/cliente/";
  static String urlCriarCarrinho = "$urlPadrao/api/nova_venda";
  static String urlAddItemCarrinho = "$urlPadrao/api/venda/novo_produto";
  static String urlRetiraItemCarrinho = "$urlPadrao/api/venda/diminuir_produto";
  static String urlDeleteItemCarrinho = "$urlPadrao/api/venda/remover_produto";
  static String urlFinalizarCarrinho = "$urlPadrao/api/venda/finalizar";

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
  static int idCliente = 0;
  static int enderecoSelected = 0;
  static int cartaoSelected = 0;
  static int pixSelected = 0;
  static MaskTextInputFormatter maskCpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static bool finalizaVenda = false;

  // Carrinho
  static int qtdCarrinho = 0;
  static String valorTotalCarrinho = "";
  static int vendaId = 0;
}
