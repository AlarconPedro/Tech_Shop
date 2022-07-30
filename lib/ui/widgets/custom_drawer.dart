import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    Widget backgroundDrawer() {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              currentTheme.isDarkTheme() ? Cores.pretoOpaco : Cores.branco,
              currentTheme.isDarkTheme() ? Cores.cinza : Cores.branco,
            ],
          ),
        ),
        //   color: currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.branco,
        // ),
      );
    }

    return Drawer(
      child: Stack(
        children: [
          backgroundDrawer(),
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                iconColor:
                    currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
                textColor:
                    currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor:
                    currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
                textColor:
                    currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor:
                    currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
                textColor:
                    currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Sair'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
