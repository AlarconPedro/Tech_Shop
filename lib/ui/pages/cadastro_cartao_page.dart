import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card_brazilian/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/datasource/local/querys/tb_pagamentoCartao_helper.dart';

import '../estilos/estilos.dart';
import '../temas/temas.dart';

class CadastroCartaoPage extends StatefulWidget {
  const CadastroCartaoPage({Key? key}) : super(key: key);

  @override
  State<CadastroCartaoPage> createState() => _CadastroCartaoPageState();
}

class _CadastroCartaoPageState extends State<CadastroCartaoPage> {
  String numeroCartao = '';
  String vencimento = '';
  String nomeTitular = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
        title: const Text('Cadastro de Cartão'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              cardName: (String value) {
                // print(value);
              },
              cardNumber: numeroCartao,
              expiryDate: vencimento,
              cardHolderName: nomeTitular,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              // cardbgColor: Colors.black,
              height: 175,
              width: MediaQuery.of(context).size.width,
              animationDuration: const Duration(milliseconds: 1000),
            ),
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: numeroCartao,
                      cvvCode: cvvCode,
                      cardHolderName: nomeTitular,
                      expiryDate: vencimento,
                      themeColor: Colors.blue,
                      cardNumberDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Número do cartão',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Validade',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome completo',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: const Color(0xff1b447b),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: const Text(
                          'Salvar Cartão',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // print('valid!');
                          TbPagamentoCartaoHelper().insertPagamentoCartao(
                            nomeTitular,
                            numeroCartao,
                            cvvCode,
                            vencimento,
                          );
                          Navigator.pop(context);
                        } else {
                          // print('invalid!');
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      numeroCartao = creditCardModel!.cardNumber;
      vencimento = creditCardModel.expiryDate;
      nomeTitular = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
