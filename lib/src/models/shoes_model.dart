import 'package:flutter/material.dart';




class ShoesModel with ChangeNotifier{

  String _assetImage ='assets/imgs/azul.png';
  double _talla =9.0;
  int _selectShadowButtom =1;

  int get selectShadowButtom => _selectShadowButtom;


  set selectShadowButtom(int index){
    _selectShadowButtom  = index;
    notifyListeners();
  }

  String get assetImage  => _assetImage;

  set assetImage(String data){
    _assetImage  = data;
    notifyListeners();
  }

  double get talla=> _talla;


  set talla(double data){
    _talla = data;
    notifyListeners();
  }

}