

import 'package:myunify/data/Mensaje.dart';

class NotificacionEvento extends Mensaje{

  //Destinatarios
  //Evento

  NotificacionEvento(bool aceptado) : super(aceptado);

  @override

  String toString() {
      String cad = super.toString();
      return "$cad,  ";
    }


}