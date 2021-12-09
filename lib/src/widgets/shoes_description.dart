import 'package:flutter/material.dart';

class ShoesDescription extends StatelessWidget {
  ShoesDescription({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(this.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          SizedBox(
            height: 20,
          ),
          Text(this.description,
              style: TextStyle(color: Colors.black54, height: 1.6)),
        ],
      )),
    );
  }
}
