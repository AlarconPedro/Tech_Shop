import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/menu_page.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/widgets/botao.dart';
import 'package:tech_shop/ui/widgets/input_text.dart';
import 'package:tech_shop/ui/widgets/login_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
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
                      ElevatedButton(
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
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MenuPage(),
                            ),
                            (route) => false,
                          );
                        },
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
}
