import 'package:flutter/material.dart';
import 'package:myunify/Colores.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({Key? key,
    required this.text,
    required this.onClicked,
  })
   : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    
    style: ElevatedButton.styleFrom( 
      shape: StadiumBorder(),
      primary: Colors.orange,
      onPrimary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    ),
    child: Text(
      text,
      style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
    onPressed: onClicked, 
  );
}