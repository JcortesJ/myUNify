import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myunify/datos/usuario.dart';
import 'package:myunify/widgets/perfil_widgets/appbar_widget.dart';
import 'package:myunify/widgets/perfil_widgets/button_widget.dart';
import 'package:myunify/widgets/perfil_widgets/profile_widget.dart';
import 'package:myunify/logica/metodos.dart';

class BuscadorAmigo extends StatefulWidget {
  @override
  _BuscadorAmigoEstado createState() => _BuscadorAmigoEstado();
}

class _BuscadorAmigoEstado extends State<BuscadorAmigo> {
  Color color_interfaz = Color(0xff9AD0EC);
  Color color_interfazGrueso = Color(0xff1572A1);
  Color color_letra = Color(0xffEFDAD7);
  Color color_fondo = Color(0xffE4E4E4);

  Usuario usuarioActual = Metodos.usuarioregistrado;

  late TextEditingController controlleramigo;

  @override
  Widget build(BuildContext context) {
    controlleramigo = TextEditingController(text: "");

    return Scaffold(
      backgroundColor: color_fondo,
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(30.0),
        children: [
          Center(
            child: Text(
              "Buscador Amigos",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ingrese el nombre de usuario de su amig@:",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              const SizedBox(height: 10),
              TextField(
                  controller: controlleramigo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  )),
              const SizedBox(height: 10),
            ],
          ),
          const SizedBox(height: 24),
          Center(child: buscar()),
          const SizedBox(height: 16),
          Center(child: cancelar()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    controlleramigo.dispose();
    super.dispose();
  }

  void _amigoEncontrado(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            //mirar si dejamos este o el alertDialog de material
            title: Text("Usuario encontrado"),
            content: Text("¿Desea enviar una solicitud de amistad?"),
            actions: <Widget>[
              FlatButton(
                  color: color_interfazGrueso,
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Enviar solicitud de amistad",
                      style: TextStyle(color: Colors.white))),
              FlatButton(
                  color: color_interfazGrueso,
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar",
                      style: TextStyle(color: Colors.white))),
            ],
          );
        });
  }

  void _amigoNoEncontrado(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            //mirar si dejamos este o el alertDialog de material
            content: Text("Usuario no encontrado, intentelo de nuevo: "),
            actions: <Widget>[
              FlatButton(
                  color: color_interfazGrueso,
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Volver",
                      style: TextStyle(color: Colors.white))),
            ],
          );
        });
  }

  Widget buscar() => ButtonWidget(
      text: "Buscar",
      onClicked: () {
        if (Metodos.BuscarUsuario(controlleramigo.text)) {
          print("encontrado");
          _amigoEncontrado(context);
        } else {
          print("no encontrado");
          _amigoNoEncontrado(context);
        }
      });
  Widget cancelar() => ButtonWidget(
      text: "Cancelar",
      onClicked: () {
        Navigator.pop(context);
      });
}
