import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/theme_provider.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaController = TextEditingController();
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
              child: Column(
                children: [
                  SingleChildScrollView(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _nomeController,
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.preto,
                              decoration: TextDecoration.none,
                              fontStyle: FontStyle.normal,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              labelStyle: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.preto,
                                decoration: TextDecoration.none,
                                fontStyle: FontStyle.normal,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.vermelho
                                      : Cores.vermelho,
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
                              hintText: 'Digite seu Nome:',
                              hintStyle: TextStyle(
                                decoration: TextDecoration.none,
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.cinzaEscuro,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _emailController,
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.preto,
                              decoration: TextDecoration.none,
                              fontStyle: FontStyle.normal,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.preto,
                                decoration: TextDecoration.none,
                                fontStyle: FontStyle.normal,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.vermelho
                                      : Cores.vermelho,
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
                              hintText: 'Digite seu Email:',
                              hintStyle: TextStyle(
                                decoration: TextDecoration.none,
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.cinzaEscuro,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _senhaController,
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.preto,
                              decoration: TextDecoration.none,
                              fontStyle: FontStyle.normal,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.preto,
                                decoration: TextDecoration.none,
                                fontStyle: FontStyle.normal,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.vermelho
                                      : Cores.vermelho,
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
                              hintText: 'Digite sua Senha:',
                              hintStyle: TextStyle(
                                decoration: TextDecoration.none,
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.cinzaEscuro,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _confirmaController,
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.branco
                                  : Cores.preto,
                              decoration: TextDecoration.none,
                              fontStyle: FontStyle.normal,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Confirmar Senha',
                              labelStyle: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.preto,
                                decoration: TextDecoration.none,
                                fontStyle: FontStyle.normal,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.preto,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.vermelho
                                      : Cores.vermelho,
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
                              hintText: 'Confirme sua Senha:',
                              hintStyle: TextStyle(
                                decoration: TextDecoration.none,
                                color: currentTheme.isDarkTheme()
                                    ? Cores.branco
                                    : Cores.cinzaEscuro,
                              ),
                            ),
                          ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text(message ?? 'Erro ao cadastrar'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
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
    if (_senhaController.text == _confirmaController.text) {
      _showDialog(context, message: 'Cadastro realizado com sucesso!');
    } else {
      _showDialog(context, message: 'Senhas não conferem!');
    }
  }
}
