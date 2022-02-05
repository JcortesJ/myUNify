import 'package:flutter/material.dart';

class Rechazar extends StatelessWidget {

  //Function accion;  required this.accion}
  Rechazar({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){print('rechazado');},
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black
        ),
        child: RichText(
          text:TextSpan(
           children: [
              WidgetSpan(
                child: Icon(
                  Icons.cancel_presentation_outlined,
                  color: Colors.red[100]
                )
              ),
              const TextSpan(
                text: " rechazar ",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ]
          )
        )
      ),
    );
  }
}