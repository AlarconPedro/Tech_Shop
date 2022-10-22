import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/globais.dart';
import 'package:tech_shop/datasource/local/querys/tb_usuario_helper.dart';
import 'package:tech_shop/datasource/models/login_model.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:http/http.dart' as http;

import '../../datasource/local/tb_usuario.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  var tbUsuario = TbUsuario();

  bool _rememberMe = false;
  bool logado = false;

  @override
  void initState() {
    _carregaDadosUsuario();
    // TODO: implement initState
    super.initState();
  }

  // TODO - Implementar o método de login
  _carregaDadosUsuario() async {
    tbUsuario = await TbUsuarioHelper().getUsuario();
    if (tbUsuario.usuario != "" && tbUsuario.senha != "") {
      _emailController.text = tbUsuario.usuario;
      _senhaController.text = tbUsuario.senha;
      logar(_emailController.text, _senhaController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: Image.asset("images/logo.png"),
                          ),
                          // Icon(
                          //   Icons.computer_outlined,
                          //   size: 60,
                          //   color: currentTheme.isDarkTheme()
                          //       ? Cores.branco
                          //       : Cores.pretoOpaco,
                          // ),
                          // Text(
                          //   'Tech Shop',
                          //   style: TextStyle(
                          //     fontSize: 30,
                          //     fontWeight: FontWeight.bold,
                          //     color: currentTheme.isDarkTheme()
                          //         ? Cores.branco
                          //         : Cores.preto,
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            child: campoLogin(
                              'E-mail',
                              'Digite seu e-mail:',
                              _emailController,
                              false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            child: campoLogin(
                              'Senha',
                              'Digite sua senha:',
                              _senhaController,
                              true,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Checkbox(
                                  value: _rememberMe,
                                  checkColor: Cores.preto,
                                  activeColor: Cores.branco,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Lembrar-me",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          currentTheme.isDarkTheme()
                                              ? Cores.vermelho
                                              : Cores.azul,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      fixedSize: const Size(120, 45),
                                    ),
                                    child: const Text('Entrar'),
                                    onPressed: () {
                                      if (_rememberMe) {
                                        TbUsuarioHelper().updateUsuario(
                                          _emailController.text.toString(),
                                          _senhaController.text.toString(),
                                        );

                                        logar(
                                          _emailController.text,
                                          _senhaController.text,
                                        );
                                      } else {
                                        TbUsuarioHelper().insertLogin(
                                          _emailController.text,
                                          _senhaController.text,
                                        );
                                        logar(
                                          _emailController.text,
                                          _senhaController.text,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    child: Text(
                      "Não tem conta? Cadastre-se",
                      style: TextStyle(
                        color: currentTheme.isDarkTheme()
                            ? Cores.branco
                            : Cores.preto,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroPage(),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget campoLogin(
    String label,
    String hint,
    TextEditingController controller,
    bool obscureText,
  ) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
      ),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person_rounded,
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.isDarkTheme() ? Cores.vermelho : Cores.vermelho,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          decoration: TextDecoration.none,
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.cinzaEscuro,
        ),
      ),
    );
  }

  Future<LoginModel> logar(String email, String senha) async {
    var response = await http.post(
      Uri.parse(Globais.urlLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'senha': senha,
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        logado = true;
        var decodedJson = json.decode(response.body);
        populateUser(decodedJson);
      });
    } else {
      setState(() {
        logado = false;
      });
    }
    logado
        ? Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MenuPage(),
            ),
            (route) => false,
          )
        : Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false,
          );
    // print(response.body);
    var decodedJson = json.decode(response.body);
    return populateUser(decodedJson);
  }

  LoginModel populateUser(Map<String, dynamic> json) {
    print(json);
    LoginModel login = LoginModel.fromJson(json['data']);
    Globais.idCliente = json['data']['id'];
    Globais.nomeCliente = json['data']['nome'];
    Globais.emailCliente = json['data']['email'];
    return login;
  }
}
