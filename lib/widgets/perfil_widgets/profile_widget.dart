import 'dart:io';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final double size;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildImage(),
    );
  }

  Widget buildImage() {
    //final imagen = NetworkImage(imagePath);
    final _image = imagePath;
    final double _size = size;

    return CircleAvatar(
      radius: _size,
      backgroundColor: Colors.transparent,
      child: _image != "null" 
          ? ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.file(
                File(imagePath),
                fit: BoxFit.fitHeight,
              ),
            )
          : Image(
            image: AssetImage('assets/images/icon.png'),
            fit: BoxFit.cover,
        ),
    );
  }
}