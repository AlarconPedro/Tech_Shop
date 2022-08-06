import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class ContaPage extends StatefulWidget {
  const ContaPage({Key? key}) : super(key: key);

  @override
  State<ContaPage> createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container();
  }
}
