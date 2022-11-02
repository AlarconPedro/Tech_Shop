import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/datasource/local/querys/tb_usuario_helper.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/login_page.dart';
import 'package:tech_shop/ui/temas/temas.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    Widget backgroundDrawer() {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              currentTheme.isDarkTheme() ? Cores.pretoOpaco : Cores.branco,
              currentTheme.isDarkTheme() ? Cores.cinza : Cores.branco,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
              blurRadius: 3,
              spreadRadius: 1,
              blurStyle: BlurStyle.normal,
              offset: const Offset(1.5, 1.5),
            ),
          ],
        ),
      );
    }

    return Drawer(
      child: Stack(
        children: [
          backgroundDrawer(),
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            children: [
              Row(
                children: [
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
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: currentTheme.isDarkTheme()
                                ? Cores.verde
                                : Cores.azul,
                            blurRadius: 2,
                            spreadRadius: 3,
                            blurStyle: BlurStyle.normal,
                            // offset: const Offset(1.5, 1.5),
                          ),
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: currentTheme.isDarkTheme()
                            ? Cores.branco
                            : Cores.cinzaClaro,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person_sharp),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
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
                      TbUsuarioHelper().updateUsuario("", "");
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const LoginPage()),
                          ),
                          (route) => false);
                    },
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: currentTheme.isDarkTheme() ? Cores.verde : Cores.azul,
              ),
              Row(
                children: [
                  Icon(
                    Icons.sunny,
                    color:
                        currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
                  ),
                  Switch(
                    activeColor: Cores.cinzaClaro,
                    value: currentTheme.isDarkTheme(),
                    onChanged: (value) {
                      setState(() {
                        String theme = value
                            ? ThemePreference.Dark
                            : ThemePreference.Light;
                        currentTheme.setTheme = theme;
                      });
                    },
                  ),
                  Icon(
                    Icons.nightlight_round,
                    color:
                        currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
