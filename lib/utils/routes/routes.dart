import 'package:flutter/widgets.dart';

// todas las rutas que antes añadíamos en el main
import 'package:flutter/widgets.dart';
import 'package:flutter03_delivery/pages/login/login_page.dart';
import 'package:flutter03_delivery/pages/registro/registro_page.dart';

final routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => LoginPage(),
  '/registro': (BuildContext context) => RegistroPage(),
};
