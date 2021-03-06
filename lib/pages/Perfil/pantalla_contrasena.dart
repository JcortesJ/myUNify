import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/Colores.dart';
import 'package:myunify/data/usuario.dart';
import 'package:myunify/widgets/perfil_widgets/appbar_widget.dart';
import 'package:myunify/widgets/perfil_widgets/button_widget.dart';
import 'package:myunify/widgets/perfil_widgets/profile_widget.dart';
import 'package:myunify/widgets/perfil_widgets/textfield_widget.dart';
import 'pantalla_perfil.dart';
import 'package:myunify/logica/metodos.dart';

class EditarContrasena extends StatefulWidget {
  @override
  _EditarContrasenaEstado createState() => _EditarContrasenaEstado();
}

class _EditarContrasenaEstado extends State<EditarContrasena> {
  Color color_interfaz = Color(0xff9AD0EC);
  Color color_interfazGrueso = Color(0xff1572A1);
  Color color_letra = Color(0xffEFDAD7);
  Color color_fondo = Color(0xffE4E4E4);

  Usuario usuarioActual = Metodos.usuarioregistrado;

  late TextEditingController controllercontrasena;

  @override
  Widget build(BuildContext context) {
    controllercontrasena = TextEditingController(text: "");
    
    return Scaffold(
      backgroundColor: Colores.colorBurbuja,
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(30.0),
        children: [
          Center(
            child: Text(
              "Cambiar contraseña",
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
                "Nueva contraseña",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextField(
          controller: controllercontrasena,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
              const SizedBox(height: 10),
              
            ],
          ),
         
          const SizedBox(height: 24),
          Center(child: guardar()),
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
    controllercontrasena.dispose();
    super.dispose();
  }

  Widget guardar() => ButtonWidget(
      text: "Guardar",
      onClicked: () {
        //Aqui verificamos que la informacion se guarde, y la remitimos al metodo editar contacto
        Metodos.EditarContrasena(
          controllercontrasena.text,
         );
     
        Navigator.pushReplacementNamed(context, "/Main");

        
      });
      Widget cancelar() => ButtonWidget(
      text: "Cancelar",
      onClicked: () {
      
        Navigator.pop(context);

        
      });
}
