import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/local/querys/tb_pagamentoPix_helper.dart';
import 'package:tech_shop/ui/pages/pages.dart';

import '../../datasource/http/http.dart';
import '../../datasource/models/login_model.dart';
import '../estilos/estilos.dart';
import '../temas/temas.dart';

class CadatroPixPage extends StatefulWidget {
  const CadatroPixPage({Key? key}) : super(key: key);

  @override
  State<CadatroPixPage> createState() => _CadatroPixPageState();
}

class _CadatroPixPageState extends State<CadatroPixPage> {
  final TextEditingController _nomeController = TextEditingController();

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
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.cinzaMedio : Cores.branco,
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
                      'Chave Pix',
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: currentTheme.isDarkTheme()
                                  ? Cores.cinzaEscuro
                                  : Cores.branco,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: currentTheme.isDarkTheme()
                                      ? Cores.branco
                                      : Cores.azul,
                                  blurRadius: 1,
                                  spreadRadius: 2,
                                  blurStyle: BlurStyle.normal,
                                  // offset: const Offset(1.5, 1.5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: DropdownButton(
                                  elevation: 0,
                                  value: 'CPF',
                                  borderRadius: BorderRadius.circular(10),
                                  hint: Text(
                                    'Tipo de chave',
                                    style: TextStyle(
                                      color: currentTheme.isDarkTheme()
                                          ? Cores.branco
                                          : Cores.cinzaEscuro,
                                    ),
                                  ),
                                  dropdownColor: currentTheme.isDarkTheme()
                                      ? Cores.cinzaEscuro
                                      : Cores.branco,
                                  style: TextStyle(
                                    color: currentTheme.isDarkTheme()
                                        ? Cores.branco
                                        : Cores.cinzaEscuro,
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: currentTheme.isDarkTheme()
                                        ? Cores.branco
                                        : Cores.azul,
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text('CPF'),
                                      value: 'CPF',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Telefone'),
                                      value: 'Telefone',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Email'),
                                      value: 'Email',
                                    ),
                                  ],
                                  onChanged: (value) {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    campoTexto(
                      controller: _nomeController,
                      hint: 'Digite sua chave:',
                      inputFormatter: Globais.maskCpf,
                      keyboardType: TextInputType.emailAddress,
                      label: 'Chave Pix',
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_nomeController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Preencha o campo da chave Pix !'),
                              backgroundColor: Cores.vermelho,
                            ),
                          );
                        } else {
                          TbPagamentoPixHelper()
                              .insertPagamentoPix(_nomeController.text);
                          _showDialog(context,
                              message: 'Cadastro realizado com sucesso!',
                              title: 'Sucesso');
                          Navigator.pop(context);
                        }
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
                        foregroundColor: currentTheme.isDarkTheme()
                            ? Cores.cinzaEscuro
                            : Cores.branco,
                        backgroundColor: currentTheme.isDarkTheme()
                            ? Cores.vermelho
                            : Cores.azul,
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
}
