import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop/ui/estilos/estilos.dart';
import 'package:tech_shop/ui/pages/carrinho_page.dart';
import 'package:tech_shop/ui/pages/categorias_page.dart';
import 'package:tech_shop/ui/pages/conta_page.dart';
import 'package:tech_shop/ui/pages/pages.dart';
import 'package:tech_shop/ui/temas/temas.dart';
import 'package:tech_shop/ui/widgets/widgets.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  ThemeProvider themeChangeProvider = ThemeProvider();
  late TabController tabController;
  int _iTabSelecionada = 0;

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    tabController = TabController(vsync: this, length: myTabs.length);
    tabController.addListener(_tabControllerSelection);
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.setTheme =
        await themeChangeProvider.themePreference.getTheme();
  }

  List<Tab> myTabs = <Tab>[
    TabBarItens.criar(CupertinoIcons.home, 'Home'),
    TabBarItens.criar(CupertinoIcons.tag, 'Categorias'),
    TabBarItens.criar(CupertinoIcons.cart, 'Carrinho'),
    TabBarItens.criar(CupertinoIcons.person_alt_circle, 'Conta'),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor:
          currentTheme.isDarkTheme() ? Cores.pretoOpaco : Cores.branco,
      appBar: AppBar(
        shadowColor: currentTheme.isDarkTheme() ? Cores.verde : Cores.preto,
        backgroundColor:
            currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.azul,
        actions: [
          const SizedBox(
            width: 60,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: InputText(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                color: currentTheme.isDarkTheme() ? Cores.branco : Cores.preto,
              ),
            ),
          ),
          // ),
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   color: Cores.branco,
          //   onPressed: () {},
          // ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: currentTheme.isDarkTheme() ? Cores.cinzaEscuro : Cores.azul,
          boxShadow: [
            BoxShadow(
              color: currentTheme.isDarkTheme() ? Cores.verde : Cores.preto,
              spreadRadius: 2,
              blurRadius: 3,
              // offset: Offset(1.5, 1.5),
            ),
          ],
        ),
        child: TabBar(
          controller: tabController,
          tabs: myTabs,
          labelPadding: EdgeInsets.zero,
          indicatorColor: Colors.transparent,
          overlayColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              return states.contains(MaterialState.selected)
                  ? currentTheme.isDarkTheme()
                      ? Cores.branco
                      : Cores.azul
                  : Colors.transparent;
            },
          ),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: currentTheme.isDarkTheme() ? Cores.verde : Cores.preto,
              width: 3,
            ),
            insets: EdgeInsets.zero,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                HomePage(),
                CategoriaPage(),
                CarrinhoPage(),
                ContaPage(),
                // const CategoriasPage(),
                // const CarrinhoPage(),
                // const ContaPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _tabControllerSelection() {
    if (tabController.indexIsChanging) {
      if (tabController.index == 0) {
        _iTabSelecionada = tabController.index;
        setState(() {
          myTabs = <Tab>[
            TabBarItens.criar(CupertinoIcons.home, 'Home'),
            TabBarItens.criar(CupertinoIcons.tag, 'Categorias'),
            TabBarItens.criar(CupertinoIcons.cart, 'Carrinho'),
            TabBarItens.criar(CupertinoIcons.person_alt_circle, 'Conta'),
          ];
        });
      }
      if (tabController.index == 1) {
        _iTabSelecionada = tabController.index;
        setState(() {
          myTabs = <Tab>[
            TabBarItens.criar(CupertinoIcons.home, 'Home'),
            TabBarItens.criar(CupertinoIcons.tag, 'Categorias'),
            TabBarItens.criar(CupertinoIcons.cart, 'Carrinho'),
            TabBarItens.criar(CupertinoIcons.person_alt_circle, 'Conta'),
          ];
        });
        setState(() {
          // _carregarTelaWebSite();
        });
      } else if (tabController.index == 2) {
        _iTabSelecionada = tabController.index;
        setState(() {
          myTabs = <Tab>[
            TabBarItens.criar(CupertinoIcons.home, 'Home'),
            TabBarItens.criar(CupertinoIcons.tag, 'Categorias'),
            TabBarItens.criar(CupertinoIcons.cart, 'Carrinho'),
            TabBarItens.criar(CupertinoIcons.person_alt_circle, 'Conta'),
          ];
        });
      } else if (tabController.index == 3) {
        _iTabSelecionada = tabController.index;
        setState(() {
          myTabs = <Tab>[
            TabBarItens.criar(CupertinoIcons.home, 'Home'),
            TabBarItens.criar(CupertinoIcons.tag, 'Categorias'),
            TabBarItens.criar(CupertinoIcons.cart, 'Carrinho'),
            TabBarItens.criar(CupertinoIcons.person_alt_circle, 'Conta'),
          ];
        });
      }
      _iTabSelecionada = tabController.index;

      // _tabController.index == 1
      //     ? Botao.criarBotaoImagem("images/icone_website_hover.png", () {
      //         Funcoes().abrirSite(_dadosRadios.urlEmissora);
      //       })
      //     : _tabController.index == 2
      //         ? Botao.criarBotaoImagem("images/facebook_icon_hover.png", () {
      //             Funcoes().abrirSite(_dadosRadios.linkFacebook);
      //           })
      //         : _tabController.index == 3
      //             ? Botao.criarBotaoImagem("images/instagram_icon_hover.png",
      //                 () {
      //                 Funcoes().abrirSite(_dadosRadios.linkInstagram);
      //               })
      //             : _tabController.index == 0
      //                 ? Botao.criarBotaoImagem(
      //                     "images/icone_home_hover.png", () {})
      //                 : _tabController.index = _iTabSelecionada;

    }
  }
}
