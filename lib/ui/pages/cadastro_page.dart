import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/datasource/http/http.dart';
import 'package:tech_shop/datasource/models/login_model.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/login_page.dart';
import 'package:tech_shop/ui/temas/theme_provider.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _numeroTelefone = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaController = TextEditingController();

  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final maskNumero = MaskTextInputFormatter(
      mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});
  final maskData = MaskTextInputFormatter(
      mask: "##/##/####", filter: {"#": RegExp(r'[0-9]')});
  final maskDefault =
      MaskTextInputFormatter(mask: "", filter: {"#": RegExp(r'[0-9]')});

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
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Dados do Usuário',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: currentTheme.isDarkTheme()
                              ? Cores.branco
                              : Cores.cinzaEscuro,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      campoTexto(
                        controller: _nomeController,
                        hint: 'Digite seu nome:',
                        inputFormatter: maskDefault,
                        keyboardType: TextInputType.name,
                        label: 'Nome',
                        obscureText: false,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: campoTexto(
                              controller: _cpfController,
                              hint: 'Digite seu CPF:',
                              inputFormatter: maskCpf,
                              keyboardType: TextInputType.number,
                              label: 'CPF',
                              obscureText: false,
                            ),
                          ),
                          Expanded(
                            child: campoTexto(
                              controller: _numeroTelefone,
                              hint: 'Digite seu Numero de Telefone:',
                              inputFormatter: maskNumero,
                              keyboardType: TextInputType.number,
                              label: 'Numero de Telefone',
                              obscureText: false,
                            ),
                          ),
                        ],
                      ),
                      campoTexto(
                        controller: _dataNascimentoController,
                        hint: 'Digite sua Data de Nascimento:',
                        inputFormatter: maskData,
                        keyboardType: TextInputType.datetime,
                        label: 'Data de Nascimento',
                        obscureText: false,
                      ),
                      campoTexto(
                        controller: _emailController,
                        hint: 'Digite seu Email:',
                        inputFormatter: maskDefault,
                        keyboardType: TextInputType.emailAddress,
                        label: 'Email',
                        obscureText: false,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: campoTexto(
                                controller: _senhaController,
                                hint: 'Digite sua Senha:',
                                inputFormatter: maskDefault,
                                keyboardType: TextInputType.visiblePassword,
                                label: 'Senha',
                                obscureText: true,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: campoTexto(
                                controller: _confirmaController,
                                hint: 'Confirme sua Senha:',
                                inputFormatter: maskDefault,
                                keyboardType: TextInputType.visiblePassword,
                                label: 'Confirmar Senha',
                                obscureText: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cadastraUsuario();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                              fontSize: 17,
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.pretoOpaco,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: currentTheme.isDarkTheme()
                              ? Cores.vermelho
                              : Cores.azul,
                          onPrimary: currentTheme.isDarkTheme()
                              ? Cores.cinzaEscuro
                              : Cores.branco,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget campoTexto({
    required String label,
    required TextEditingController controller,
    required String hint,
    required TextInputFormatter inputFormatter,
    required TextInputType? keyboardType,
    required bool obscureText,
  }) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obscureText,
        inputFormatters: [inputFormatter],
        controller: controller,
        style: TextStyle(
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
            decoration: TextDecoration.none,
            fontStyle: FontStyle.normal,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
              style: BorderStyle.solid,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
              style: BorderStyle.solid,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
              style: BorderStyle.solid,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  currentTheme.isDarkTheme() ? Cores.vermelho : Cores.vermelho,
              style: BorderStyle.solid,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            decoration: TextDecoration.none,
            color:
                currentTheme.isDarkTheme() ? Cores.branco : Cores.cinzaEscuro,
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, {String? message, String? title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(message ?? 'Erro ao cadastrar'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void cadastraUsuario() {
    _nomeController.text != "" &&
        _emailController.text != "" &&
        _senhaController.text != "" &&
        _confirmaController.text != "";
    if (_nomeController.text != "" &&
        _emailController.text != "" &&
        _cpfController.text != "" &&
        _senhaController.text != "" &&
        _confirmaController.text != "") {
      var response = _getLogin();
      print(response);
    } else if (_senhaController.text == _confirmaController.text) {
      _showDialog(context, message: 'Senhas não conferem!', title: 'Erro');
      _nomeController.clear();
      _emailController.clear();
      _cpfController.clear();
      _senhaController.clear();
      _dataNascimentoController.clear();
      _dataNascimentoController.clear();
    } else {
      _showDialog(context, message: 'Preencha todos os campos!', title: 'Erro');
      _dataNascimentoController.clear();
      _nomeController.clear();
      _emailController.clear();
      _cpfController.clear();
      _senhaController.clear();
      _dataNascimentoController.clear();
    }
  }

  Future<List<LoginModel>> _getLogin() async {
    var response = await HttpRequest().postLogin(
      nome: _nomeController.text,
      email: _emailController.text,
      senha: _senhaController.text,
      cpf: _cpfController.text,
      dataNascimento: _dataNascimentoController.text,
      telefone: _numeroTelefone.text,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      _showDialog(context,
          message: 'Cadastro realizado com sucesso!', title: 'Sucesso');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
      return (json as List).map((e) => LoginModel.fromJson(e)).toList();
    } else {
      _showDialog(context, message: 'Erro ao Cadastrar!', title: 'Erro');

      throw Exception('Falha ao Cadastrar Usuário');
    }
  }
}
