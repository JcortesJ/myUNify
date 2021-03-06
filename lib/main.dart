import 'package:flutter/material.dart';
import 'package:myunify/pages/Amigos/lista_amigos.dart';
import 'pages/paginaPrincipal.dart';
import 'package:myunify/pages/Perfil/pantalla_editar.dart';
import 'package:myunify/pages/Perfil/pantalla_perfil.dart';
import 'package:myunify/pages/Perfil/pantalla_contrasena.dart';
import 'package:myunify/pages/calendario/Calendario.dart';
import 'package:myunify/pages/calendario/editarClase.dart';
import 'package:myunify/pages/calendario/editarEstudio.dart';
import 'package:myunify/pages/calendario/editarOcio.dart';
import 'package:myunify/webview/pagina.dart';
import 'pages/loginPages/Registro.dart';
import 'pages/loginPages/inicio.dart';
import 'pages/loginPages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyUNify',
        theme: ThemeData(
          fontFamily: "Subs",
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (BuildContext context) => Inicio(),
          "/login": (BuildContext context) => Login(),
          "/registro": (BuildContext context) => Registro(),
          "/EditarOcio": (BuildContext context) => EditarEventoOcio(),
          "/EditarEventoEstudio": (BuildContext context) => EditarEventoEstudio(),
          "/Calendario": (BuildContext context) => VistaCalendar(),
          "/EditarEventoClase": (BuildContext context) => EditarEventoClase(),
          "/paginaBienestar": (BuildContext context) => paginaBienestar(),
          "/Main": (BuildContext context) => PaginaPrincipal(),
          "/Editar": (BuildContext context) => EditarPerfil(),
          "/Contrasena": (BuildContext context) => EditarContrasena(),
          "/amigos": (BuildContext context) => PaginaAmigos(),
          "/Ver": (BuildContext context) => PaginaPerfil(),
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) =>
                Scaffold(body: Center(child: Text('Not Found'))),
          );
        },
      );
  }
}
