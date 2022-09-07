import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/globais.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/menu_page.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/widgets/botao.dart';
import 'package:tech_shop/ui/widgets/input_text.dart';
import 'package:tech_shop/ui/widgets/login_text.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool logado = false;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
          ),
          SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.computer_outlined,
                        size: 60,
                        color: currentTheme.isDarkTheme()
                            ? Cores.branco
                            : Cores.pretoOpaco,
                      ),
                      Text(
                        'Tech Shop',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: currentTheme.isDarkTheme()
                              ? Cores.branco
                              : Cores.preto,
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        child: LoginText(),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        child: SenhaText(),
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
                                  primary: currentTheme.isDarkTheme()
                                      ? Cores.vermelho
                                      : Cores.azul,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fixedSize: const Size(120, 45),
                                ),
                                child: const Text('Entrar'),
                                onPressed: () {
                                  logar(email, senha).then(
                                    (value) => logado
                                        ? Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const MenuPage(),
                                            ),
                                            (route) => false,
                                          )
                                        : Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ),
                                            (route) => false,
                                          ),
                                  );
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
                  color:
                      currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
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
        ],
      ),
    );
  }

  Widget campoLogin(
      String label, String hint, TextEditingController controller) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return TextField(
      controller: controller,
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
        hintText: 'Digite seu Login:',
        hintStyle: TextStyle(
          decoration: TextDecoration.none,
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.cinzaEscuro,
        ),
      ),
    );
  }

  Future<http.Response> logar(String email, String senha) async {
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
    setState(() {
      response.statusCode == 200 ? logado = true : logado = false;
    });
    return json.decode(response.body);
  }
}
