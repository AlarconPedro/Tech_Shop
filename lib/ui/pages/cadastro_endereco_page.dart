import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/api/api.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:http/http.dart' as http;

class CadastroEnderecoPage extends StatefulWidget {
  const CadastroEnderecoPage({Key? key}) : super(key: key);

  @override
  State<CadastroEnderecoPage> createState() => _CadastroEnderecoPageState();
}

class _CadastroEnderecoPageState extends State<CadastroEnderecoPage> {
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();

  final maskCEP = MaskTextInputFormatter(
      mask: "#####-###", filter: {"#": RegExp(r'[0-9]')});
  final maskNumero =
      MaskTextInputFormatter(mask: "####", filter: {"#": RegExp(r'[0-9]')});
  final maskUF =
      MaskTextInputFormatter(mask: "AA", filter: {"A": RegExp(r'[A-Z]')});
  final maskDefault =
      MaskTextInputFormatter(mask: "", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.cinzaClaro,
      extendBody: true,
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
          child: Container(
            decoration: BoxDecoration(
              color:
                  currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
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
                      'Dados do Endereço',
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
                      controller: _enderecoController,
                      hint: 'Digite o Endereço:',
                      inputFormatter: maskDefault,
                      keyboardType: TextInputType.name,
                      label: 'Endereço',
                      obscureText: false,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: campoTexto(
                            controller: _cepController,
                            hint: 'Digite o CEP:',
                            inputFormatter: maskCEP,
                            keyboardType: TextInputType.number,
                            label: 'CEP',
                            obscureText: false,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: campoTexto(
                            controller: _numeroController,
                            hint: 'Digite o Numero:',
                            inputFormatter: maskNumero,
                            keyboardType: TextInputType.number,
                            label: 'Numero',
                            obscureText: false,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.22,
                          child: campoTexto(
                            tamanhoMaximo: 2,
                            onChanged: (value) {
                              TextEditingValue(
                                text: value.toUpperCase(),
                                selection: _ufController.selection,
                              );
                              setState(() {
                                if (value.length == 2) {
                                  _ufController.text = value.toUpperCase();
                                }
                              });
                            },
                            controller: _ufController,
                            hint: 'UF:',
                            inputFormatter: maskDefault,
                            keyboardType: TextInputType.name,
                            label: 'UF',
                            obscureText: false,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: campoTexto(
                            controller: _cidadeController,
                            hint: 'Digite a Cidade:',
                            inputFormatter: maskDefault,
                            keyboardType: TextInputType.emailAddress,
                            label: 'Cidade',
                            obscureText: false,
                          ),
                        ),
                        Expanded(
                          child: campoTexto(
                            controller: _bairroController,
                            hint: 'Digite o Bairro:',
                            inputFormatter: maskDefault,
                            keyboardType: TextInputType.none,
                            label: 'Bairro',
                            obscureText: false,
                          ),
                        ),
                      ],
                    ),
                    campoTexto(
                      controller: _complementoController,
                      hint: 'Digite Complemento:',
                      inputFormatter: maskDefault,
                      keyboardType: TextInputType.none,
                      label: 'Complemento',
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cadastrarEndereco();
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

  Widget campoTexto({
    required String label,
    required TextEditingController controller,
    required String hint,
    required TextInputFormatter inputFormatter,
    required TextInputType? keyboardType,
    required bool obscureText,
    int? tamanhoMaximo,
    Function(String)? onChanged,
  }) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: onChanged,
        maxLength: tamanhoMaximo,
        obscureText: obscureText,
        inputFormatters: [inputFormatter],
        controller: controller,
        style: TextStyle(
          color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
        ),
        decoration: InputDecoration(
          counterText: '',
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

  void cadastrarEndereco() async {
    final response = await http.post(
      Uri.parse(Globais.urlCadastroEndereco),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'cliente_id': Globais.idCliente.toString(),
          'cep': _cepController.text,
          'logradouro': _enderecoController.text,
          'numero': _numeroController.text,
          'estado': _ufController.text,
          'cidade': _cidadeController.text,
          'bairro': _bairroController.text,
          'complemento': _complementoController.text,
        },
      ),
    );
    // print(response.body);
    if (response.statusCode == 201) {
      _showDialog(context,
          title: 'Sucesso', message: 'Endereço cadastrado com Sucesso');
      Navigator.pop(context);
    } else {
      _showDialog(context,
          title: 'Erro', message: 'Erro ao cadastrar o Enderço');
      _cepController.clear();
      _enderecoController.clear();
      _numeroController.clear();
      _ufController.clear();
      _cidadeController.clear();
      _bairroController.clear();
      _complementoController.clear();
    }
  }
}
