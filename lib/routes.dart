import 'package:flutter/material.dart';
import 'package:unimar_sab_19/approutes.dart';
import 'package:unimar_sab_19/views/cadastro/cadastro_page.dart';
import 'package:unimar_sab_19/views/config/config_page.dart';
import 'package:unimar_sab_19/views/detalhes/detalhes_page.dart';
import 'package:unimar_sab_19/views/favoritos/favoritos_page.dart';
import 'package:unimar_sab_19/views/homepage/homepage.dart';
import 'package:unimar_sab_19/views/login/login_page.dart';
import 'package:unimar_sab_19/views/profile/perfil_page.dart';

Map<String, WidgetBuilder> routes = {
  Approutes.home: (context) => Homepage(),
  Approutes.login: (context) => LoginPage(),
  Approutes.cadastro: (context) => CadastroPage(),
  Approutes.detalhes: (context) => DetalhesPage(),
  Approutes.perfil: (context) => PerfilPage(),
  Approutes.favoritos: (context) => FavoritosPage(),
  Approutes.configuracoes: (context) => ConfigPage(),
};
