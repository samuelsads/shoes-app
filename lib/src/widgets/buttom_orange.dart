import 'package:flutter/material.dart';

class ButtomOrange extends StatelessWidget {
  const ButtomOrange(
      {Key? key,
      required this.text,
      this.alto = 50,
      this.ancho = 150,
      this.color = Colors.orange})
      : super(key: key);
  final String text;
  final double alto;
  final double ancho;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ancho,
      height: alto,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100), color: color),
      child: Text('$text', style: TextStyle(color: Colors.white)),
    );
  }
}
