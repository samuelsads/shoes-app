import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:shoes/src/pages/shoes_desc_page.dart';
import 'package:shoes/src/pages/zapatos_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'shoesApp',
        home: ShoesDescPage());
  }
}
