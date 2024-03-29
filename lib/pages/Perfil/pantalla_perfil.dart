import 'package:flutter/material.dart';
import 'package:myunify/data/Evento.dart';
import 'package:myunify/data/eventoLogica.dart';
import 'package:myunify/widgets/generales/Colores.dart';
import 'package:myunify/widgets/generales/FondoPantalla.dart';
import 'package:myunify/widgets/perfil_widgets/appbar_widget.dart';
import 'package:myunify/widgets/perfil_widgets/button_widget.dart';
import 'package:myunify/widgets/perfil_widgets/container_widget.dart';
import 'package:myunify/widgets/perfil_widgets/profile_widget.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/data/usuario.dart';
import 'package:myunify/pages/paginaPrincipal.dart';
import 'pantalla_editar.dart';
import 'pantalla_contrasena.dart';
import 'package:myunify/widgets/perfil_widgets/container_widget2.dart';

class PaginaPerfil extends StatefulWidget {
  @override
  _PerfilEstado createState() => _PerfilEstado();
}

class _PerfilEstado extends State<PaginaPerfil> {
  // final contactoActual = Metodos.contactoActual;

  dynamic usuarioActual = Metodos.usuarioregistrado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colores.colorBurbuja,
      //appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          Center(
            child: Text(
              "Tu perfil",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ProfileWidget(
            imagePath: usuarioActual.foto,
            onClicked: () async {},
            size: 55,
          ),
          const SizedBox(height: 24),
          construirInformacion(usuarioActual),
          const SizedBox(height: 16),
          Center(child: editarContacto()),
          const SizedBox(height: 16),
          Center(child: cambiarContrasena()),
          const SizedBox(height: 16),
          Center(child: cerrarSesion()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget editarContacto() => ButtonWidget(
      text: "Editar datos",
      onClicked: () {
        Navigator.pushNamed(context, "/Editar");
      });

  Widget cambiarContrasena() => ButtonWidget(
      text: "Cambiar contraseña",
      onClicked: () {
        Navigator.pushNamed(context, "/Contrasena");
      });

  Widget cerrarSesion() => ButtonWidget(
      text: "Cerrar sesión",
      onClicked: () {
        Metodos.usuarioregistrado.calendarUsuario =
            MetodosEvento.ListaEventosDB.cast<DateTime, Evento>();
        Navigator.pushReplacementNamed(context, "/");
      });

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    super.dispose();
  }

  Widget construirInformacion(Usuario user) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContainerWidget2(text: "Nombre:"),
          const SizedBox(
            height: 6,
          ),
          ContainerWidget(text: usuarioActual.nombre),
          const SizedBox(
            height: 10,
          ),
          ContainerWidget2(text: "Usuario:"),
          const SizedBox(
            height: 6,
          ),
          ContainerWidget(text: usuarioActual.nombreUsuario),
          const SizedBox(
            height: 10,
          ),
          ContainerWidget2(text: "Instagram:"),
          const SizedBox(
            height: 6,
          ),
          ContainerWidget(text: usuarioActual.usuarioig),
          const SizedBox(
            height: 10,
          ),
          ContainerWidget2(text: "Correo:"),
          const SizedBox(
            height: 6,
          ),
          ContainerWidget(text: usuarioActual.correo),
          const SizedBox(
            height: 10,
          ),
        ],
      );
}
